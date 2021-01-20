FactoryBot.define do
  factory :product do
    association :user

    after(:build) do |product|
      product.image.attach(io: File.open('public/images/sam1.png'), filename: 'sam1.png')
    end

    product                {Faker::Name.initials(number: 4)}
    explain                {Faker::Name.initials(number: 10)}
    price                  {Faker::Number.within(range: 300..9999)}
    category_id               {2}
    state_id                  {2}
    shipping_id               {2}
    prefecture_id             {2}
    waitday_id                {2}
  end
end