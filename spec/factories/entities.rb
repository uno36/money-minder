FactoryBot.define do
  factory :entity do
    name { Faker::Lorem.word }
    amount { Faker::Number.decimal(l_digits: 2) }
  end
end
