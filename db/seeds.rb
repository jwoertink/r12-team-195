if Rails.env.development?
  require 'ffaker' 

  DatabaseCleaner.orm = 'active_record'
  DatabaseCleaner.strategy = :truncation
  DatabaseCleaner.clean

  user = FactoryGirl.create(:user)

  # anonymous_user = FactoryGirl.create(:anonymous_user)

  # 10.times do
  #   anonymous_user.drinks << FactoryGirl.create(:drink)
  # end

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
  
  wares = YAML.load_file(File.join(Rails.root, 'lib', 'wares.yml'))
  wares.map { |w| Ware.create(w) }
else
  # Production seed data...
  
end