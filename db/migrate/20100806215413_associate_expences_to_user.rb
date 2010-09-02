class AssociateExpencesToUser < ActiveRecord::Migration
  def self.up
    add_column :expences, "user_id", :integer
  end

  def self.down
    remove_column :expences, "user_id"
  end
end
