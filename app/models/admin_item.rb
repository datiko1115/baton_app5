class AdminItem < ApplicationRecord
  belongs_to :admin
  #belongs_to :item
  #belongs_to :user
  has_many_attached :images
  has_many_attached :vrf_images
  has_one :buyer_order

  

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  validates :admin_item_name, presence: true
  validates :admin_description, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  
  validates :proper_price, presence: true
  validates :proper_price, numericality: { with: /\A[0-9]+\z/, message: 'is invalid. Input Half-width number' }
  validates :proper_price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' }
  validates :proper_price, numericality: { only_integer: true } 

  validates :price, presence: true
  validates :price, numericality: { with: /\A[0-9]+\z/, message: 'is invalid. Input Half-width number' }
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' }
  validates :price, numericality: { only_integer: true } 

  validates :images, presence: true
  validates :images, length: { minimum: 1, maximum: 6 }
  validates :vrf_images, length: { minimum: 1, maximum: 6 }
end
