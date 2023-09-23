# spec/factories/users.rb

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { 'password123' } 
    fullname { Faker::Name.name } 
  end
end
