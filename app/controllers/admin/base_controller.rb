class Admin::BaseController < ApplicationController
  before_action :require_admin

  private

  def require_admin
    redirect_to root_path unless admin?
  end
end
