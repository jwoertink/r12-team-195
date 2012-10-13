require 'ffaker' 

DatabaseCleaner.orm = 'active_record'
DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean

user = FactoryGirl.create(:user)

# FactoryGirl.create(:drink)

# user.drinks << drinks

5.times do
  FactoryGirl.create(:random_user)
end

10.times do
  user.drinks << FactoryGirl.create(:drink)
end