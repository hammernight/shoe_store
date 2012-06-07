class CreateShoes < ActiveRecord::Migration
  def self.up
    create_table :shoes do |t|
      t.string :name
    end
  end

  def self.down
    drop_table :shoes
  end
end
