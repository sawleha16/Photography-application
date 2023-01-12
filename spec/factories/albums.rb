FactoryBot.define do
  factory :album do
    name {Faker::Name.name}
    description {"abcdef"}
  end
end
