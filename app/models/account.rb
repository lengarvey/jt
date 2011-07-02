class Account < ActiveRecord::Base
  has_many :activation_links
end
