class ChangeShoeBrandToReference < ActiveRecord::Migration
  def self.up
    change_column :shoes, :brand, :integer
    rename_column :shoes, :brand, :brand_id
  end

  def self.down
    change_column :shoes, :brand, :string
    rename_column :shoes, :brand_id, :brand
  end
end
