FactoryBot.define do
  factory :comment do
    text { "MyText" }
    user_id { 1 }
    item_id { 1 }
    admin_user_id { 1 }
    admin_item_id { 1 }
  end
end
