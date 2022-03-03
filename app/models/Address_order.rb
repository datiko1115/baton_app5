class AddressOrder
  include ActiveModel::Model
  attr_accessor :postcode, :prefecture_id, :city, :address, :building, :phone, :user_id, :item_id, :token
 
  validates :postcode, presence: true
  validates :postcode, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'is invalid. Enter it as follows (e.g. 123-4567)' }
  validates :prefecture_id, presence: true
  validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}
  validates :city, presence: true
  validates :address, presence: true
  validates :phone, presence: true
  validates :phone, numericality: { with: /\A[0-9]+\z/, message: 'is invalid. Input Half-width number' }
  validates :phone, format: { with: /\A\d{10,11}\z/, message: 'is too short' }
  validates :token, presence: true
  
  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(postcode: postcode, prefecture_id: prefecture_id, city: city, address: address, building: building, phone: phone, order_id: order.id)
  end
end