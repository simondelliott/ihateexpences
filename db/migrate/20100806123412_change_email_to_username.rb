class ChangeEmailToUsername < ActiveRecord::Migration
  def self.up
    rename_column "users", "email", "username"
  end

  def self.down
    rename_column "users", "username", "email"
  end
end
