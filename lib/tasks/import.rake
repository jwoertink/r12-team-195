namespace :import do
  def import_file(file)
    File.read(file).split("\n").each do |line|
      data = JSON.parse(line)

      drink = Drink.new(
        name: data['name'],
        glass: data['glass'],
        description: data['description'],
        instructions: data['instructions'])

      data['ingredients'].each do |ingredient|
        drink.ingredients << Ingredient.new(amount: ingredient['amount'],
                                            unit: ingredient['unit'],
                                            name: ingredient['name'])
      end

      unless drink.save
        raise drink.inspect
      end
    end
  end

  desc 'Import all data files'
  task data: :environment do
    Dir["#{Rails.root}/data/*.json"].each { |f| import_file(f) }
  end

  desc 'Import single file'
  task file: :environment do
    import_file(ARGV[1])
  end
end
