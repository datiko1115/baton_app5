class AdminsController < ApplicationController
  def show
    @admin = Admin.find(params[:id])
    @adminname = @admin.admin_name
    @admin_items = @admin.admin_items
  end
end
