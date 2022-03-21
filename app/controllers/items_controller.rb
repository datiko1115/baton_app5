class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :move_to_index, except: [:index, :show]
  before_action :ensure_correct_user, only:[:edit, :update, :destroy]
  before_action :soldout_cant_be_edited, only:[:edit, :update]
  before_action :customer_user_cant_sell, only:[:new, :create, :edit, :update, :destroy]
  
  

  def index
    @items = Item.includes(:user).order("created_at DESC")
    @admin_items = AdminItem.includes(:admin).order("created_at DESC")
  end

  def new
    @item = Item.new
    @buyer_orders = BuyerOrder.where(user_id: current_user)
  end 

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end 

  def show
  end 

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :edit
    end
  end  

  private
  def item_params
    params.require(:item).permit(:item_name, :admin_item_id, :description, :category_id, :price, :condition_id, :recipient_id, :prefecture_id, :shipment_id, {images: []}).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def ensure_correct_user
    unless @item.user == current_user
     redirect_to items_path
    end
  end

  def soldout_cant_be_edited
    if @item.order.present?
     redirect_to root_path
    end
  end

  def customer_user_cant_sell
    if user_signed_in? && current_user.buyer_or_customer_id.to_s == "3"
     redirect_to root_path
    end
  end
end
