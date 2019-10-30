class SessionsController < ApplicationController
  def create
    session[:role] = params[:role]
    redirect_to root_path
  end

  def destroy
    session.delete(:role)
    redirect_to root_path
  end
end
