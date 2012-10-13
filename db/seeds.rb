require 'ffaker' 

DatabaseCleaner.orm = 'active_record'
DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean

user = FactoryGirl.create(:user)

5.times do
  FactoryGirl.create(:random_user)
end

10.times do
  user.drinks << FactoryGirl.create(:drink)
end

5.times do
  FactoryGirl.create(:glassware)
  FactoryGirl.create(:hardware)
end