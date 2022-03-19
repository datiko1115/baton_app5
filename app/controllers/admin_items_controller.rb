class AdminItemsController < ApplicationController
  before_action :authenticate_admin!, only: [:new, :create]
  before_action :customer_user_cant_do, only: [:show, :new, :create]


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

  def show
    @admin_item = AdminItem.find(params[:id])
  end

  private
  def admin_item_params
    params.require(:admin_item).permit(:admin_item_name, :admin_description, :category_id, :proper_price, :price, {images: []}).merge(admin_id: current_admin.id)
  end

  def customer_user_cant_do
    if user_signed_in? && current_user.buyer_or_customer_id.to_s == "3"
     redirect_to root_path
    end
  end

end
