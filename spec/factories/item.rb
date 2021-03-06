FactoryBot.define do
  factory :item do
    item_name     {"りんご"}
    description   {"りんごです"}
    category_id   {"2"}
    price         {"1000"}
    condition_id  {"2"}
    recipient_id  {"2"}
    prefecture_id {"2"}
    shipment_id   {"2"}

    association :user
    
    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
