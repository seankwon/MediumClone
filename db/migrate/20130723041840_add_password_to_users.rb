class AddPasswordToUsers < ActiveRecord::Migration
  def change
    add_column :users, :password_hash, :text
    add_column :users, :password_salt, :text
  end
end
