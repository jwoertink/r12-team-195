# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ware do
    name { Faker::Company.name }
    description { Faker::Lorem.sentences(2) }
    photo { fixture_file_upload(Rails.root.join('spec', 'fixtures', 'glassware.jpg')) }

    factory :glassware do
      kind 'glassware'
    end

    factory :hardware do
      kind 'hardware'
      photo { fixture_file_upload(Rails.root.join('spec', 'fixtures', 'shaker.jpeg')) }
    end
  end
end
