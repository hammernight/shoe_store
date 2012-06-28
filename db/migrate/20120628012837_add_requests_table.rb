class AddRequestsTable < ActiveRecord::Migration
  def self.up
    create_table :requests do |t|
      t.text :data
      t.timestamps
      t.text :ip_address
    end
  end

  def self.down
    drop_table :requests
  end
end
