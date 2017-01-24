class Web::Users::ApplicationController < Web::ApplicationController
  def check_auth
    redirect_to new_sessions_path unless signed_in?
  end
end
