class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :prefecture
  belongs_to :shipment
  belongs_to :recipient
  belongs_to :condition

  validates :item_name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :price, numericality: { with: /\A[0-9]+\z/, message: 'is invalid. Input Half-width number' }
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' }
  validates :price, numericality: { only_integer: true } 
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :recipient_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipment_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :image, presence: true

end
