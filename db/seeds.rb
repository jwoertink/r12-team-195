if Rails.env.development?
  require 'ffaker'
  include ActionDispatch::TestProcess

  DatabaseCleaner.orm = 'active_record'
  DatabaseCleaner.strategy = :truncation
  DatabaseCleaner.clean

  anonymous_user = FactoryGirl.create(:anonymous_user)
  10.times do
    anonymous_user.drinks << FactoryGirl.create(:drink)
  end

  5.times do
    FactoryGirl.create(:random_user)
  end

  user = FactoryGirl.create(:random_user)
  10.times do
    user.drinks << FactoryGirl.create(:drink)
  end

  100.times do
    user = User.all.sort { rand }.first
    drink = Drink.all.sort { rand }.first
    Rating.create!(user_id:user.id, drink_id:drink.id, feeling:rand(2))
  end

  5.times do
    # FactoryGirl.create(:glassware)
    FactoryGirl.create(:hardware)
  end

  # wares = YAML.load_file(File.join(Rails.root, 'lib', 'wares.yml'))
  # wares.map { |w| Ware.create(w) }
else
  # Production seed data...
end
