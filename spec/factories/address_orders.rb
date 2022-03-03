FactoryBot.define do
  factory :address_order do
    postcode { '123-4567' }
    prefecture_id { 2 }
    city { '東京都' }
    address { '1-1' }
    building { '東京ハイツ' }
    phone { '08012341234' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
