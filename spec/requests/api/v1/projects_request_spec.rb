describe Api::V1::ProjectsController, type: :request do
  let!(:user) { create :user }
  let!(:headers) { user.create_new_auth_token }

  describe 'GET /api/v1/projects' do
    let!(:projects) { create_list :project, 2, :with_tasks, user: user }

    it 'responds with 200 | Ok' do
      get api_v1_projects_path, headers: headers

      expect(response).to have_http_status :ok
      expect(response).to match_json_response('api/v1/project/entities', projects: projects)
    end
  end

  describe 'GET /api/v1/project/:id' do
    let(:project) { create :project, user: user }

    it 'responds with 200 | Ok' do
      get api_v1_project_path(project.id), headers: headers

      expect(response).to have_http_status :ok
      expect(response).to match_json_response('api/v1/project/entity', project: project)
    end

    it 'responds with 401 | Unauthorized', type: :unauthorized_response do
      get api_v1_project_path(project.id)
    end

    it 'responds with 403 | Forbidden', type: :forbidden_response do
      get api_v1_project_path(create(:project).id), headers: headers
    end

    it 'responds with 404 | Not Found', type: :not_found_response do
      get api_v1_project_path(100), headers: headers
    end
  end

  describe 'POST /api/v1/projects', :show_in_doc do
    let(:params) { attributes_for(:project) }

    it 'responds with 201 | Created' do
      post api_v1_projects_path, headers: headers, params: params

      expect(response).to have_http_status :created
      expect(response).to match_json_response('api/v1/project/entity', project: Project.last)
    end

    it 'responds with 401 | Unauthorized', type: :unauthorized_response do
      post api_v1_projects_path, params: params
    end

    it 'responds with 422 | Unprocessable entity', type: :unprocessable_response do
      params = attributes_for(:project, :invalid)
      post api_v1_projects_path, headers: headers, params: params
    end
  end

  describe 'PATCH /api/v1/project/:id', :show_in_doc do
    let(:project) { create :project, user: user }
    let(:params) { attributes_for(:project) }

    it 'responds with 200 | Ok' do
      patch api_v1_project_path(project.id), headers: headers, params: params

      expect(response).to have_http_status :ok
      expect(response).to match_json_response('api/v1/project/entity', project: project.reload)
    end

    it 'responds with 401 | Unauthorized', type: :unauthorized_response do
      patch api_v1_project_path(project.id), params: params
    end

    it 'responds with 403 | Forbidden', type: :forbidden_response do
      patch api_v1_project_path(create(:project).id), params: params, headers: headers
    end

    it 'responds with 404 | Not Found', type: :not_found_response do
      patch api_v1_project_path(100), params: params, headers: headers
    end

    it 'responds with 422 | Unprocessable entity', type: :unprocessable_response do
      params = attributes_for(:project, :invalid)
      patch api_v1_project_path(project.id), params: params, headers: headers
    end
  end

  describe 'DELETE /api/v1/projects/:id', :show_in_doc do
    let(:project) { create :project, user: user }

    it 'responds with 200 | Ok' do
      delete api_v1_project_path(project.id), headers: headers
      expect(response).to have_http_status :ok
      expect(Project.exists?(project.id)).to be_falsey
    end

    it 'responds with 401 | Unauthorized', type: :unauthorized_response do
      delete api_v1_project_path(project.id)
    end

    it 'responds with 403 | Forbidden', type: :forbidden_response do
      delete api_v1_project_path(create(:project).id), headers: headers
    end

    it 'responds with 404 | Not Found', type: :not_found_response do
      delete api_v1_project_path(100), headers: headers
    end
  end
end
