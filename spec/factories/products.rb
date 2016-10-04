FactoryGirl.define do
  factory :product do
    name  { Faker::Commerce.product_name }
    price { Faker::Number.decimal(2) }
    status true

    trait :archive do
      status false
    end
  end
end
