class AddKeyToUser < ActiveRecord::Migration
  def self.up
     add_index :users, [:username]
     add_index :users, [:password_hash]
     add_index :users, [:username, :password_hash]
  end

  def self.down
    remove_index :users, :column => [:username]
    remove_index :users, :column => [:password_hash]
    remove_index :users, :column => [:username, :password_hash]
  end
end
