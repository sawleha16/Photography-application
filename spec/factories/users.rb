FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { "1234test" }
    password_confirmation { "1234test" }
    username { Faker::Name.name }
    age { 24 }
    interests { 'portraits' }
  end
end
