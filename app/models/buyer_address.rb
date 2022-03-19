class BuyerAddress < ApplicationRecord
  belongs_to :buyer_order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  
end
