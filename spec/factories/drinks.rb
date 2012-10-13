# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :drink do
    name { Faker::Company.name }
    description { Faker::Lorem.paragraph }
    instructions { Faker::Lorem.paragraph }
    photo { fixture_file_upload(Rails.root.join('spec', 'fixtures', 'Jack-and-Coke.jpg')) }
    glass 'Mug'
  end
end
