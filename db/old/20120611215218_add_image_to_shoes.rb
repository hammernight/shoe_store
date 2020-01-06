class AddImageToShoes < ActiveRecord::Migration
  def self.up
    add_column :shoes, :image_path, :string
  end
end