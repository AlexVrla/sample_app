class ApplicationController < ActionController::Base
#  include SessionsHelper
  # helper_method :log_in

  def log_in(user)
    session[:user_id] = user.id
  end

end
