class Web::Users::TasksController < Web::Users::ApplicationController
  before_action :check_auth

  def index
    @tasks = current_user.fetch_tasks.includes(:user).order(created_at: :desc).page(params[:page])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(attributes)

    if @task.save
      redirect_to users_task_path(@task)
    else
      render action: :new
    end
  end

  def show
    @task = fetch_task
  end

  def edit
    @task = fetch_task
  end

  def update
    @task = fetch_task

    if @task.update attributes
      redirect_to users_task_path(@task)
    else
      render action: :edit
    end
  end

  def destroy
    task = fetch_task
    task.destroy
    flash[:notice] = "Task ##{task.id} deleted"

    redirect_to users_tasks_path
  end

  private

  def fetch_task
    Task.find(params[:id])
  end

  def attributes
    params.require(:task)
      .permit(:name, :description, :state, :user_id, :attachment)
  end
end
