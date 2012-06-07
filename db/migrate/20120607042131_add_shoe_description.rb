class AddShoeDescription < ActiveRecord::Migration
  def change
    add_column :shoes, :brand, :string
    add_column :shoes, :release_month, :string
    add_column :shoes, :description, :text
  end

  def self.down
    remove_column :name, :brand, :release_month, :description
  end
end
