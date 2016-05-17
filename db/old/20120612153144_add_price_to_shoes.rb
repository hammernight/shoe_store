class AddPriceToShoes < ActiveRecord::Migration
  def self.up
    add_column :shoes, :price, :string
  end
end
