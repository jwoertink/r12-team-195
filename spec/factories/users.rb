# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "email#{n}@example.com"
    end
    password 'secret'

    factory :random_user do
      name { Faker::Name.name }
    end

    factory :anonymous_user do
      token SecureRandom.hex(8)
      type "AnonymousUser"
    end
  end
end
