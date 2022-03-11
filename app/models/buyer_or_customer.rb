class Buyer_or_customer < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'バイヤーとして登録する' },
    { id: 3, name: 'カスタマーとして登録する' }

  ]

  include ActiveHash::Associations
  has_many :user
  end