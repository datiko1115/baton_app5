class BuyerOrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :soldout_cant_be_bought, only:[:index, :create]
  before_action :are_you_admin?, only:[:create]
  before_action :authenticate_user!, only: [:index,:create]

  def index
    @buyer_address_buyer_order = BuyerAddressBuyerOrder.new
  end

  def create
    @buyer_address_buyer_order = BuyerAddressBuyerOrder.new(buyer_order_params)
    if @buyer_address_buyer_order.valid?
      pay_item
      @buyer_address_buyer_order.save      
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def buyer_order_params
    params.require(:buyer_address_buyer_order).permit(:postcode, :prefecture_id, :city, :address, :building, :buyer_order_id, :phone).merge(user_id: current_user.id, admin_item_id: params[:admin_item_id], token: params[:token])
  end

  def set_item
    @admin_item = AdminItem.find(params[:admin_item_id])
  end

  def soldout_cant_be_bought
    if @admin_item.buyer_order.present?
     redirect_to root_path
    end
  end
  
  def are_you_admin?
    if current_admin
     redirect_to buyer_items_path
   end
  end

  def pay_item       
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @admin_item.price,  # 商品の値段
      card: buyer_order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end
