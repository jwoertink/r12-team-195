# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ingredient do
    drink_id 1
    name "MyString"
    amount 1.5
  end
end
