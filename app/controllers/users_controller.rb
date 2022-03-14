class UsersController < ApplicationController
  def show
    @first_name = current_user.first_name
    @last_name = current_user.last_name
    @items = current_user.items
  end
end
