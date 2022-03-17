class AdminsController < ApplicationController
  before_action :authenticate_admin![:show]
  def show
    @admin = Admin.find(params[:id])
    @adminname = @admin.admin_name
  end
end
