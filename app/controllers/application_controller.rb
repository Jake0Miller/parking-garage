class ApplicationController < ActionController::Base
  helper_method :current_user, :admin?

  def current_user
    @current_user ||= session[:role]
  end

  def admin?
    current_user == 'admin'
  end
end
