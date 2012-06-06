class CreateIssues < ActiveRecord::Migration
  def self.up
    create_table :issues, :force => true do |t|
      t.text :title
      t.text :description
      t.integer :priority
      t.timestamps
    end
  end

  def self.down
    drop_table :issues
  end
end
