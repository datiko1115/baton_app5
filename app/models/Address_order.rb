class AddressOrder
  include ActiveModel::Model
  attr_accessor :postcode, :prefecture_id, :city, :address, :building, :phone, :user_id, :item_id, :token
 
  with_options presence: true do
    validates :postcode
    validates :prefecture_id
    validates :city
    validates :address
    validates :phone
    validates :token
    validates :user_id
    validates :item_id
    
  end

  validates :postcode, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'is invalid. Enter it as follows (e.g. 123-4567)' }
  validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}
  validates :phone, format: { with: /\A\d{10,11}\z/ }
  
  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(postcode: postcode, prefecture_id: prefecture_id, city: city, address: address, building: building, phone: phone, order_id: order.id)
  end
end