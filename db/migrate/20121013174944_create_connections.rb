class CreateConnections < ActiveRecord::Migration
  def up
    create_table :connections do |t|
      t.integer :source_id
      t.integer :destination_id
      t.boolean :blocked, :default => false
      t.boolean :mutual, :default => false
      t.timestamps
    end
  end

  def down
    drop_table :connections
  end
end
