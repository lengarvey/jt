class Job < ActiveRecord::Base
  belongs_to :account

  validates_associated :account 
end
