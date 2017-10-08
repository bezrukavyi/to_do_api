class Api::V1::ApplicationController < ApplicationController
  include DeviseTokenAuth::Concerns::SetUserByToken
  include CanCan::ControllerAdditions
  include Renderable

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from CanCan::AccessDenied, with: :access_denied

  alias current_user current_api_v1_user

  def access_denied
    render_error([I18n.t('errors.access_denied')], 403)
  end

  def record_not_found(_error)
    render_error([I18n.t('errors.not_found')], 404)
  end

  def authenticate_user!
    return if current_user
    render_error([I18n.t('devise.failure.unauthenticated')], 401)
  end
end
