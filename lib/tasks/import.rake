namespace :import do
  def import_file(file)
    File.read(file).split("\n").each do |line|
      data = JSON.parse(line)

      user = User.find_or_initialize_by_email('admin@mybestdrink.com')
      password = SecureRandom.hex(8)
      user.name = 'The Mixologist'
      user.password = password
      user.password_confirmation = password
      user.save!
      user.reload

      drink = Drink.new(
        user: user,
        name: data['name'],
        glass: data['glass'],
        description: data['description'],
        instructions: data['instructions'])
      drink.save

      data['ingredients'].each do |i|
        ingredient = Ingredient.find_or_initialize_by_name(i['name'])
        
        component = Component.new
        component.drink = drink
        component.ingredient = ingredient
        component.amount = i['amount']
        component.unit = ie['unit']
        component.save  
      end


      print '.'
      
    end
  end

  desc 'Import all data files'
  task data: :environment do
    Drink.destroy_all
    Dir["#{Rails.root}/data/*.json"].each { |f| import_file(f) }
  end

  desc 'Import single file'
  task file: :environment do
    import_file(ARGV[1])
  end
end
