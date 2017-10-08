RSpec.configure do |config|
  config.after(:each, type: :not_found_response) do
    expect(response).to have_http_status :not_found
    expect(response).to match_json_response('api/v1/short_error', errors: [I18n.t('errors.not_found')])
  end
end
