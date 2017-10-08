class Api::V1::AttachmentsController < Api::V1::ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource :task, only: %i[index create]
  load_and_authorize_resource through: :task, shallow: true, only: %i[index create]
  load_and_authorize_resource only: :destroy

  def index
    respond_with @attachments
  end

  def create
    @attachment.save
    respond_with @attachment
  end

  def destroy
    @attachment.destroy
    respond_with @attachment
  end

  private

  def attachment_params
    params.permit(:name, :file)
  end
end
