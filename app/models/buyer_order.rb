class BuyerOrder < ApplicationRecord
  belongs_to :user
  belongs_to :admin_item
  has_one :buyer_address
end
