class CreateJobs < ActiveRecord::Migration
  def self.up
    create_table :jobs do |t|
      t.string :title
      t.string :company
      t.integer :account_id

      t.timestamps
    end
  end

  def self.down
    drop_table :jobs
  end
end
