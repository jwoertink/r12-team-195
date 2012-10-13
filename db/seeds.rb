if Rails.env.development?
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

  100.times do
    user = User.find(rand(User.count) + 1)
    drink = Drink.find(rand(Drink.count) + 1)
    Rating.create!(user_id:user.id, drink_id:drink.id, feeling:rand(2))
  end

  5.times do
    FactoryGirl.create(:glassware)
    FactoryGirl.create(:hardware)
  end
  wares = YAML.load_file(File.join(Rails.root, 'lib', 'wares.yml'))
  wares.map { |w| Ware.create(w) }
else
  # Production seed data...
end
