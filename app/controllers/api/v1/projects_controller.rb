class Api::V1::ProjectsController < Api::V1::ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @projects = @projects.includes(:tasks)
    respond_with @projects, each_serializer: Api::V1::ProjectSerializer::Entities,
                            include: '*'
  end

  def show
    respond_project
  end

  def create
    @project.save
    respond_project
  end

  def update
    @project.update(project_params)
    respond_project
  end

  def destroy
    @project.destroy
    respond_project
  end

  private

  def project_params
    params.permit(:title, :complete_at)
  end

  def respond_project
    respond_with @project, serializer: Api::V1::ProjectSerializer::Entity,
                           include: '*'
  end
end
