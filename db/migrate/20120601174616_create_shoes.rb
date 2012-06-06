class CreateShoes < ActiveRecord::Migration
  def self.up
    create_table :shoes do |t|
      t.string :brand
      t.string :name
      t.string :color
      t.text :description
      t.string :release_month
    end
  end

  def self.down
    drop_table :shoes
  end
end
