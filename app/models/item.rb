class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  validates :item_name, presence: true
  validates :description, presence: true
  validates :category_id, presence: true
  validates :price, presence: true
  validates :condition_id, presence: true  
  validates :recipient_id, presence: true
  validates :prefecture_id, presence: true
  validates :shipment_id, presence: true

  # validates :price, numericality: { in: 18..65 }
end
