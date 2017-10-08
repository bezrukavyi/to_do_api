describe Api::V1::Auth::RegistrationsController, type: :request do
  let(:user) { create(:user) }

  describe 'POST /api/v1/auth' do
    context 'Success' do
      it 'responds with 201 | Created', :show_in_doc do
        post api_v1_user_registration_path, params: attributes_for(:user, :default_password)
        expect(response).to have_http_status :created
        expect(response).to match_json_response('api/v1/auth/registration', resource: User.last)
      end
    end
  end
end
