class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :feeling
      t.string :user_id
      t.string :drink_id

      t.timestamps
    end
  end
end
