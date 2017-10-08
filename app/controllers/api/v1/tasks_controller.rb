class Api::V1::TasksController < Api::V1::ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource :project, only: %i[index create]
  load_and_authorize_resource through: :project, shallow: true, only: %i[index create]
  load_and_authorize_resource only: %i[show update destroy]

  def index
    respond_with @tasks, each_serializer: Api::V1::TaskSerializer::Entities
  end

  def show
    respond_task
  end

  def create
    @task.save
    respond_task
  end

  def update
    @task.update(task_params)
    respond_task
  end

  def destroy
    @task.destroy
    respond_task
  end

  private

  def task_params
    params.permit(:title, :position, :checked, :complete_at)
  end

  def respond_task
    respond_with @task, serializer: Api::V1::TaskSerializer::Entity
  end
end
