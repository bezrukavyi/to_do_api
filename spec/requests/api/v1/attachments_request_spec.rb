describe Api::V1::TasksController, type: :request do
  let!(:user) { create :user }
  let!(:project) { create :project, user: user }
  let!(:task) { create :task, project: project }
  let!(:attachment) { create :attachment, task: task }
  let!(:another_task) { create :task }
  let!(:another_attachment) { create :attachment, task: another_task }

  let!(:headers) { user.create_new_auth_token }

  describe 'GET /api/v1/task/:task_id/attachments' do
    let!(:another_attachment) { create :attachment }

    it 'responds with 200 | Ok' do
      get api_v1_task_attachments_path(task_id: task.id), headers: headers

      expect(response).to have_http_status :ok
      expect(response).to match_json_response('api/v1/attachment/entities', attachments: [attachment])
    end

    it 'responds with 401 | Unauthorized', type: :unauthorized_response do
      get api_v1_task_attachments_path(task_id: task.id)
    end

    it 'responds with 403 | Forbidden', type: :forbidden_response do
      get api_v1_task_attachments_path(task_id: another_task.id), headers: headers
    end

    it 'responds with 404 | Not Found', type: :not_found_response do
      get api_v1_task_attachments_path(task_id: 100), headers: headers
    end
  end

  describe 'POST /api/v1/project/:project_id/tasks', :show_in_doc do
    let(:params) { attributes_for(:attachment) }

    it 'responds with 201 | Created' do
      post api_v1_task_attachments_path(task_id: task.id), headers: headers, params: params

      expect(response).to have_http_status :created
      expect(response).to match_json_response('api/v1/attachment/entity', attachment: Attachment.last)
    end

    it 'responds with 401 | Unauthorized', type: :unauthorized_response do
      post api_v1_task_attachments_path(task_id: task.id), params: params
    end

    it 'responds with 422 | Unprocessable entity', type: :unprocessable_response do
      params = attributes_for(:task, :invalid)
      post api_v1_task_attachments_path(task_id: task.id), headers: headers, params: params
    end

    it 'responds with 403 | Forbidden', type: :forbidden_response do
      post api_v1_task_attachments_path(task_id: another_task.id), params: params, headers: headers
    end
  end

  describe 'DELETE /api/v1/tasks/:id', :show_in_doc do
    it 'responds with 200 | Ok' do
      delete api_v1_attachment_path(attachment.id), headers: headers
      expect(response).to have_http_status :ok
      expect(Attachment.exists?(attachment.id)).to be_falsey
    end

    it 'responds with 401 | Unauthorized', type: :unauthorized_response do
      delete api_v1_attachment_path(attachment.id)
    end

    it 'responds with 403 | Forbidden', type: :forbidden_response do
      delete api_v1_attachment_path(another_attachment.id), headers: headers
    end

    it 'responds with 404 | Not Found', type: :not_found_response do
      delete api_v1_attachment_path(100), headers: headers
    end
  end
end
