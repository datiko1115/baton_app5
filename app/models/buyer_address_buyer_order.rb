class BuyerAddressBuyerOrder
  include ActiveModel::Model
  attr_accessor :postcode, :prefecture_id, :city, :address, :building, :phone, :user_id, :admin_item_id, :token
 
  with_options presence: true do
    validates :postcode
    validates :prefecture_id
    validates :city
    validates :address
    validates :phone
    validates :token
    validates :user_id
    validates :admin_item_id
    
  end

  validates :postcode, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'is invalid. Enter it as follows (e.g. 123-4567)' }
  validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}
  validates :phone, format: { with: /\A\d{10,11}\z/ }
  
  def save
    buyer_order = BuyerOrder.create(admin_item_id: admin_item_id, user_id: user_id)
    BuyerAddress.create(postcode: postcode, prefecture_id: prefecture_id, city: city, address: address, building: building, phone: phone, buyer_order_id: buyer_order.id)
  end
end

# buyer_order = BuyerOrder.new(admin_item_id: admin_item_id, user_id: user_id)
# buyer_order.valid?
# true or false
# buyer_order.errors.full_messages
# xxx
