class CreateWares < ActiveRecord::Migration
  def change
    create_table :wares do |t|
      t.string :kind
      t.string :name
      t.string :photo
      t.text :description
      t.timestamps
    end
  end
end
