class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]


  def index
    @address_order = AddressOrder.new
  end

  def create
    @address_order = AddressOrder.new(item_params)
    if @address_order.valid?
      @address_order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:address_order).permit(:postcode, :prefecture_id, :city, :address, :building, :order_id, :phone).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
