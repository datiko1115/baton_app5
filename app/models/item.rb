class Item < ApplicationRecord
  belongs_to :user
  has_many_attached :images
  has_one :order
  has_one :admin_item

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :prefecture
  belongs_to :shipment
  belongs_to :recipient

  validates :item_name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :price, numericality: { with: /\A[0-9]+\z/, message: 'is invalid. Input Half-width number' }
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' }
  validates :price, numericality: { only_integer: true } 
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :recipient_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipment_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :images, presence: true
  validates :images, length: { minimum: 1, maximum: 5, message: "は1枚以上5枚以下にしてください" }


end
