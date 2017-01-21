class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include AuthManager

  def check_auth
    redirect_to new_sessions_path unless signed_in?
  end
end
