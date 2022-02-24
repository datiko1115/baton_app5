FactoryBot.define do
  factory :user do
    nickname              {"田中太郎"}
    email                 {Faker::Internet.free_email}
    password              {"1c" + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name            {"田中"}
    last_name             {"太郎"}
    first_kana            {"タナカ"}
    last_kana             {"タロウ"}
    birthday              {Faker::Date.birthday}
  end
end