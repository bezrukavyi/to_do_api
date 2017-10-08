class Api::V1::Auth::RegistrationsController < DeviseTokenAuth::RegistrationsController
  protected

  def sign_up_params
    params.permit(:name, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.permit(:name, :email, :current_password, :password)
  end

  def render_create_success
    respond_with @resource
  end

  def render_create_error
    respond_with @resource
  end
end
