FactoryGirl.define do
  factory :product do
    name Faker::ChuckNorris.fact
    price Faker::Number.decimal(2)
  end
end
