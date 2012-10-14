class CreateUtensils < ActiveRecord::Migration
  def change
    create_table :utensils do |t|
      t.string :drink_id
      t.string :ware_id

      t.timestamps
    end
  end
end
