class VirtualFittingsController < ApplicationController
  def index
    if current_user.images.empty?
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      admin_item = AdminItem.find(@item.admin_item_id.to_s)

      user_image = MiniMagick::Image.read(current_user.images[0].download)
      item_image = MiniMagick::Image.read(admin_item.vrf_images[0].download)


      user_image.auto_orient

      result = user_image.composite(item_image) do |config|
        config.compose 'Over'
        config.gravity 'NorthWest'
        config.geometry '+0+0'
      end

      result.format("jpg")
      if Rails.env.production? 
        result.write("public/assets/virtualfitting#{current_user.id}.jpg")
        FileUtils.chmod(0644,"public/assets/virtualfitting#{current_user.id}.jpg")

        logger.debug "http://54.168.8.242/assets/virtualfitting#{current_user.id}.jpg"
      else
        result.write("public/images/virtualfitting#{current_user.id}.jpg")
      end
    end
  end
end
