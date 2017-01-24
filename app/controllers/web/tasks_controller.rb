class Web::TasksController < Web::ApplicationController
  def index
    @tasks = Task.all.includes(:user).order(created_at: :desc).page(params[:page])
  end
end
