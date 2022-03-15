class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :edit, :update]
  before_action :set_user, only: [:show, :edit, :update]


  def show
    @nickname = @user.nickname
    @items = @user.items
  end

  def edit
    unless @user == current_user
      redirect_to user_path(@user)
    end
  end
  
  def update
      if current_user.update(user_params)
        redirect_to user_path(current_user.id)
      else
         redirect_to edit_user_path(current_user)
      end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :nickname, :first_name, :last_name, :first_kana, :last_kana, :birthday, :buyer_or_customer_id, {images: []})
  end
end
