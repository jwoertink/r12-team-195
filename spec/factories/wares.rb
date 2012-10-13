# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ware do
    name { Faker::Company.name }

    factory :glassware do
      kind 'glassware'
    end

    factory :hardware do
      kind 'hardware'
    end
  end
end
