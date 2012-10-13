# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name { Faker::Name.name }
    email 'you@example.com'
    password 'secret'

    factory :random_user do
      name { Faker::Name.name }
      email { Faker::Internet.email }
    end

    factory :anonymous_user do
      email { Faker::Internet.email }
      reset_password_token nil
      reset_password_sent_at nil
      remember_created_at nil
      sign_in_count 0
      current_sign_in_at nil
      last_sign_in_at nil
      current_sign_in_ip nil
      last_sign_in_ip nil
      created_at Time.now
      updated_at Time.now
      name nil
      photo nil
      token SecureRandom.hex(8)
      type "AnonymousUser"
    end
  end
end
