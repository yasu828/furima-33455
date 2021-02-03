FactoryBot.define do
  factory :buydata do
    association :user
    association :product
  end
end
