FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
   end
   nickname              {Faker::Name.initials(number: 2)}
   email                 {Faker::Internet.free_email}
   password              {'1a' + Faker::Alphanumeric.alphanumeric(number: 10)}
   password_confirmation {password}
   fname                 {person.first.kanji}
   lname                 {person.last.kanji}
   fkata                 {person.first.katakana}
   lkata                 {person.last.katakana}
   birth                 {Faker::Date.in_date_period}
  end
end
