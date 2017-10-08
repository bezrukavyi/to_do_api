RSpec.configure do |config|
  config.after(:each, type: :forbidden_response) do
    expect(response).to have_http_status :forbidden
    expect(response).to match_json_response('api/v1/short_error', errors: [I18n.t('errors.access_denied')])
  end
end
