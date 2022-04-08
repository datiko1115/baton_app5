class VirtualFittingsController < ApplicationController
  def index
    if current_user.images.empty?
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      admin_item = AdminItem.find(@item.admin_item_id.to_s)

      # current_user_image = current_user.images[0]
      # logger.debug "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#{current_user_image}"
      # user_img = rails_blob_url(current_user_image, host: request.base_url)
      # logger.debug "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#{user_img}"
      # item_img = rails_blob_url(admin_item.vrf_images[0], host: request.base_url)
      # logger.debug "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#{item_img}"


      # user_image = MiniMagick::Image.open(user_img)
      # item_image = MiniMagick::Image.open(item_img)

      user_image = MiniMagick::Image.read(current_user.images[0].download)
      logger.debug "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#{user_image}"
      item_image = MiniMagick::Image.read(admin_item.vrf_images[0].download)
      logger.debug "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#{item_image}"

      # user_image = MiniMagick::Image.open(File.join("http://localhost:3000",user_img))
      # item_image = MiniMagick::Image.open(File.join("http://localhost:3000",item_img))

      # user_image = MiniMagick::Image.open(Rails.root.join(user_img))
      # item_image = MiniMagick::Image.open(Rails.root.join(item_img))

      logger.debug "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"


      user_image.auto_orient
      logger.debug "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#{user_image}"

      result = user_image.composite(item_image) do |config|
        config.compose 'Over'
        config.gravity 'NorthWest'
        config.geometry '+0+0'
      end

      logger.debug "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#{config}"

      result.format("jpg")
      if Rails.env.production?
        result.chmod（0644、"testfile"、"out"） 
        result.write("public/assets/virtualfitting#{current_user.id}.jpg")
        logger.debug "http://54.168.8.242/assets/virtualfitting#{current_user.id}.jpg"
      else
        result.write("public/images/virtualfitting#{current_user.id}.jpg")
      end
    end
  end
end
