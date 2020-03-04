class Admin::ApplicationController < ApplicationController
  before_action :authenticate_admin!

  def index; end

  private

  def authenticate_admin!
    authenticate_user!

    unless current_user.admin?
      redirect_to root_path, alert: 'You are not authorized to view this page'
    end
  end
end
