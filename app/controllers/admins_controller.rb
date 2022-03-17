class AdminsController < ApplicationController
  def show
    @admin = Admin.find(params[:id])
    @adminname = @admin.admin_name
  end
end
