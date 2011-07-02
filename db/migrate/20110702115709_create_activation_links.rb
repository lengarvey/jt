class CreateActivationLinks < ActiveRecord::Migration
  def self.up
    create_table :activation_links do |t|
      t.integer :account_id
      t.string :uuid
      t.datetime :expires

      t.timestamps
    end
  end

  def self.down
    drop_table :activation_links
  end
end
