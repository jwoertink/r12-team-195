class CreateDrinks < ActiveRecord::Migration
  def change
    create_table :drinks do |t|
      t.string :name
      t.string :glass
      t.text :description
      t.text :instructions
      t.integer :user_id
      t.integer :ware_id
      t.string :photo
      t.timestamps
    end
  end
end
