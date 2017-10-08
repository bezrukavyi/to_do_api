RSpec.configure do |config|
  config.after(:each, type: :unauthorized_response) do
    expect(response).to have_http_status :unauthorized
    expect(response).to match_json_response('api/v1/short_error', errors: [I18n.t('devise.failure.unauthenticated')])
  end
end
