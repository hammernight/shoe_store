class AddAchievements < ActiveRecord::Migration
  def self.up
    create_table :achievements do |t|
      t.text :type, :null => false
      t.integer :request_id, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :achievements
  end
end
