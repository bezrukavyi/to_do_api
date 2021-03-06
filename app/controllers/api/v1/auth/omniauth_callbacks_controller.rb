class Api::V1::Auth::OmniauthCallbacksController < DeviseTokenAuth::OmniauthCallbacksController
  def get_resource_from_auth_hash
    info = auth_hash['info']
    @resource = resource_class.find_or_initialize_by(email: info['email'])

    if @resource.new_record?
      @oauth_registration = true
      set_random_password
    end

    assign_provider_attrs(@resource, auth_hash)

    extra_params = whitelisted_params
    @resource.assign_attributes(extra_params) if extra_params

    @resource
  end

  def auth_origin_url
    ENV['OAUTH_SUCCESS']
  end

  def create_auth_params
    @auth_params = {
      'token': @token,
      'client_id': @client_id,
      'uid': @resource.uid
    }

    @auth_params[:oauth_registration] = true if @oauth_registration
    @auth_params
  end

  def assign_provider_attrs(user, auth_hash)
    user.assign_attributes(
      email: auth_hash['info']['email']
    )
  end
end
