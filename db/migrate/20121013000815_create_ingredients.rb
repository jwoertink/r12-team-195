class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.integer :drink_id
      t.string :name
      t.float :amount
      t.string :unit

      t.timestamps
    end
  end
end
