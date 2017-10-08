describe Api::V1::TasksController, type: :request do
  let!(:user) { create :user }
  let!(:project) { create :project, user: user }
  let!(:headers) { user.create_new_auth_token }

  describe 'GET /api/v1/project/:project_id/tasks' do
    let!(:another_project) { create :project }
    let!(:another_task) { create :task, project: another_project }
    let!(:task) { create :task, project: project }

    it 'responds with 200 | Ok' do
      get api_v1_project_tasks_path(project_id: project.id), headers: headers

      expect(response).to have_http_status :ok
      expect(response).to match_json_response('api/v1/task/entities', tasks: [task])
    end

    it 'responds with 401 | Unauthorized', type: :unauthorized_response do
      get api_v1_project_tasks_path(project_id: project.id)
    end

    it 'responds with 403 | Forbidden', type: :forbidden_response do
      get api_v1_project_tasks_path(project_id: another_project.id), headers: headers
    end

    it 'responds with 404 | Not Found', type: :not_found_response do
      get api_v1_project_tasks_path(project_id: 100), headers: headers
    end
  end

  describe 'GET /api/v1/task/:id' do
    let(:task) { create :task, project: project }

    it 'responds with 200 | Ok' do
      get api_v1_task_path(task.id), headers: headers

      expect(response).to have_http_status :ok
      expect(response).to match_json_response('api/v1/task/entity', task: task)
    end

    it 'responds with 401 | Unauthorized', type: :unauthorized_response do
      get api_v1_task_path(task.id)
    end

    it 'responds with 403 | Forbidden', type: :forbidden_response do
      get api_v1_task_path(create(:task).id), headers: headers
    end

    it 'responds with 404 | Not Found', type: :not_found_response do
      get api_v1_task_path(100), headers: headers
    end
  end

  describe 'POST /api/v1/project/:project_id/tasks', :show_in_doc do
    let(:another_project) { create :project }
    let(:params) { attributes_for(:task) }

    it 'responds with 201 | Created' do
      post api_v1_project_tasks_path(project_id: project.id), headers: headers, params: params

      expect(response).to have_http_status :created
      expect(response).to match_json_response('api/v1/task/entity', task: Task.last)
    end

    it 'responds with 401 | Unauthorized', type: :unauthorized_response do
      post api_v1_project_tasks_path(project_id: project.id), params: params
    end

    it 'responds with 422 | Unprocessable entity', type: :unprocessable_response do
      params = attributes_for(:task, :invalid)
      post api_v1_project_tasks_path(project_id: project.id), headers: headers, params: params
    end

    it 'responds with 403 | Forbidden', type: :forbidden_response do
      post api_v1_project_tasks_path(project_id: another_project.id), params: params, headers: headers
    end
  end

  describe 'PATCH /api/v1/task/:id', :show_in_doc do
    let(:task) { create :task, project: project }
    let(:params) { attributes_for(:task) }

    it 'responds with 200 | Ok' do
      patch api_v1_task_path(task.id), headers: headers, params: params

      expect(response).to have_http_status :ok
      expect(response).to match_json_response('api/v1/task/entity', task: task.reload)
    end

    it 'responds with 401 | Unauthorized', type: :unauthorized_response do
      patch api_v1_task_path(task.id), params: params
    end

    it 'responds with 403 | Forbidden', type: :forbidden_response do
      patch api_v1_task_path(create(:task).id), params: params, headers: headers
    end

    it 'responds with 404 | Not Found', type: :not_found_response do
      patch api_v1_task_path(100), params: params, headers: headers
    end

    it 'responds with 422 | Unprocessable entity', type: :unprocessable_response do
      params = attributes_for(:task, :invalid)
      patch api_v1_task_path(task.id), params: params, headers: headers
    end
  end

  describe 'DELETE /api/v1/tasks/:id', :show_in_doc do
    let(:task) { create :task, project: project }

    it 'responds with 200 | Ok' do
      delete api_v1_task_path(task.id), headers: headers
      expect(response).to have_http_status :ok
      expect(Task.exists?(task.id)).to be_falsey
    end

    it 'responds with 401 | Unauthorized', type: :unauthorized_response do
      delete api_v1_task_path(task.id)
    end

    it 'responds with 403 | Forbidden', type: :forbidden_response do
      delete api_v1_task_path(create(:task).id), headers: headers
    end

    it 'responds with 404 | Not Found', type: :not_found_response do
      delete api_v1_task_path(100), headers: headers
    end
  end
end
