FactoryBot.define do
  factory :car do
    car_brand { "MyString" }
    state_number { "MyString" }
    user { nil }
  end
end
