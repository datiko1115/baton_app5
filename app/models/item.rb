class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  validates :item_name, presence: true
  validates :description, presence: true
  validates :category_id, presence: true
  validates :price, presence: true
  validates :price, numericality: { with: /\A[0-9]+\z/, message: 'is invalid. Input Half-width number' }
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' }
  validates :price, numericality: { only_integer: true } #横に長くなりすぎそうだから３つに分けたんで、つっこまんといてください
  validates :condition_id, presence: true  
  validates :recipient_id, presence: true
  validates :prefecture_id, presence: true
  validates :shipment_id, presence: true
  validates :image, presence: true

end
