class CreateAccounts < ActiveRecord::Migration
  def self.up
    create_table :accounts do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :password_hash
      t.date :birth_date
      t.string :location

      t.timestamps
    end
  end

  def self.down
    drop_table :accounts
  end
end
