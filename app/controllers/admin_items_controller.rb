class AdminItemsController < ApplicationController
  before_action :authenticate_admin!, only:[:show]

  def new
    @admin_item = AdminItem.new
  end

  def create
    @admin_item = AdminItem.new(admin_item_params)
    if @admin_item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def admin_item_params
    params.require(:admin_item).permit(:admin_item_name, :admin_description, :category_id, :proper_price, :price, {images: []}).merge(admin_id: current_admin.id)
  end

end
