class VirtualFittingsController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    user_image = MiniMagick::Image.open(rails_blob_url(current_user.images[0]))
    item_image = MiniMagick::Image.open(rails_blob_url(@item.images[4])) 
    # item_image = MiniMagick::Image.open("app/assets/images/furima-intro05.png")
     #item_image.format("jpg")
     #item_image.write("item_image.png")
     #item_image.variant.auto_orient
    result = user_image.composite(item_image) do |config| 
      config.compose 'Over'
      config.gravity 'NorthWest'
      config.geometry '+0+0'
    end
    result.format("jpg") 
    result.write("app/assets/images/virtualfitting#{current_user.id}.jpg")
  end
end
