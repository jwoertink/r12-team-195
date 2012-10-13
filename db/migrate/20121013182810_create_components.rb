class CreateComponents < ActiveRecord::Migration
  def change
    create_table :components do |t|
      t.integer :drink_id
      t.integer :ingredient_id
      t.float :amount
      t.string :unit

      t.timestamps
    end
  end
end
