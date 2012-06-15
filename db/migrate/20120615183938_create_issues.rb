class CreateIssues < ActiveRecord::Migration
  def self.up
    create_table :issues do |t|
      t.string :title
      t.string :description
      t.string :severity
    end
  end

  def self.down
    drop_table :issues
  end
end
