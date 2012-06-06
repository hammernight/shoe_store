class AddRequestsTable < ActiveRecord::Migration
  def self.up
    create_table :requests, :force => true do |t|
        t.text :data
        t.timestamps
    end
  end

  def self.down
    drop_table :requests
  end
end