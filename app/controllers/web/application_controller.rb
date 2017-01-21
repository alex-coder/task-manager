class Web::ApplicationController < ApplicationController
  helper_method :current_user, :signed_in?
end
