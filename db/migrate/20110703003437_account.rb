class Account < ActiveRecord::Migration
  def self.up
    change_table :accounts do |t|
      t.string :password_salt
    end
  end

  def self.down
    remove_column :accounts, :password_salt
  end
end
