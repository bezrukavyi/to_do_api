module Renderable
  def render_error(object, status)
    if object.instance_of?(Array)
      render json: error_object(object), status: status
    else
      render json: object, status: status, serializer: ActiveModel::Serializer::ErrorSerializer
    end
  end

  def error_object(errors)
    { errors: errors.map { |error| Hash['title', error] } }
  end
end
