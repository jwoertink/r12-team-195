# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :drink do
    name { Faker::Company.name }
    description { Faker::Lorem.paragraph }
    instructions { Faker::Lorem.paragraph }
  end
end
