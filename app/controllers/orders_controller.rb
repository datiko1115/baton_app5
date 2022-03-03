class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :soldout_cant_be_bought, only:[:index, :create]
  before_action :are_you_seller?, only:[:index, :create]
  before_action :authenticate_user!, only: [:index,:create]

  def index
    @address_order = AddressOrder.new
  end

  def create
    @address_order = AddressOrder.new(order_params)
    if @address_order.valid?
      pay_item
      @address_order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def order_params
    params.require(:address_order).permit(:postcode, :prefecture_id, :city, :address, :building, :order_id, :phone).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def soldout_cant_be_bought
    if @item.order.present?
     redirect_to root_path
    end
  end
  
  def are_you_seller?
    if @item.user == current_user
     redirect_to items_path
    end
  end

  def pay_item       
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

end
