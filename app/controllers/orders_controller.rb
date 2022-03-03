class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @address_order = AddressOrder.new
  end

  def create
    @address_order = AddressOrder.new(item_params)
    if @address_order.valid?
      @address_order.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private
  def item_params
    params.require(:address_order).permit(:postcode, :prefecture_id, :city, :address, :building, :order_id, :phone).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
