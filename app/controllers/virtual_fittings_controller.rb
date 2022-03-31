class VirtualFittingsController < ApplicationController
  def index
    if current_user.images.empty?
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      admin_item = AdminItem.find(@item.admin_item_id.to_s)

      user_image = MiniMagick::Image.open(rails_blob_path(current_user.images[0]))
      item_image = MiniMagick::Image.open(rails_blob_path(admin_item.vrf_images[0])) 
      
      user_image.auto_orient

      result = user_image.composite(item_image) do |config| 
        config.compose 'Over'
        config.gravity 'NorthWest'
        config.geometry '+0+0'
      end
      result.format("jpg") 
      if Rails.env.production? 
        result.write("public/assets/virtualfitting#{current_user.id}.jpg")
      else 
        result.write("public/images/virtualfitting#{current_user.id}.jpg")
      end
    end
  end
end
