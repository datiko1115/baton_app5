class VirtualFittingsController < ApplicationController
  def index
    if current_user.images.empty?
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      admin_item = AdminItem.find(@item.admin_item_id.to_s)
      puts '@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@'
      logger.info(rails_blob_path(current_user.images[0]))
      logger.error(rails_blob_path(current_user.images[0]))
      current_user_image = rails_blob_url(current_user.images[0])
      admin_item_vrf_image = rails_blob_url(admin_item.vrf_images[0])
      user_image = MiniMagick::Image.open(current_user_image)
      item_image = MiniMagick::Image.open(admin_item_vrf_image) 
      
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
