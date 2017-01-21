class Api::TasksController < Api::ApplicationController
  def state
    @task = current_user.fetch_tasks.find(params[:task_id])
    @task.update(state: params[:state])
    render json: @task.as_json(only: [:id, :state])
  end
end
