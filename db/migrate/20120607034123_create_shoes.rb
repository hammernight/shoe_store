class CreateShoes < ActiveRecord::Migration
  def self.up
    create_table :shoes do |t|
      t.string :name
      t.string :brand_id
      t.string :release_month
      t.text :description
      t.string :image_path
      t.string :price
    end
  end

  def self.down
    drop_table :shoes
  end
end
