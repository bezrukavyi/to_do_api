class Api::V1::Auth::SessionsController < DeviseTokenAuth::SessionsController
  protected

  def resource_params
    params.permit(:email, :password)
  end

  def render_create_success
    respond_with @resource
  end

  def render_create_error
    respond_with @resource
  end
end
