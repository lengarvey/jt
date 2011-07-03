class Account < ActiveRecord::Base
  has_many :activation_links
  has_many :jobs

  attr_accessor :password, :flash
  def state
    return :full if location or birth_date
    return :partial
  end

  validates_confirmation_of :password
  validates :email, :presence => true, 
    :length => {:minimum => 3, :maximum => 254},
    :uniqueness => true,
    :format => {:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i}
  validate :max_jobs
    
  before_save :encrypt_password

  def max_jobs
    if jobs.count > 6
      errors.add_to_base "Should not have more than 7 jobs"
    end
  end
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
  
  def self.authenticate(email, password)  
    account = find_by_email(email)  
    return account unless account.password_hash and account.password_salt
    if account and account.password_hash == BCrypt::Engine.hash_secret(password, account.password_salt)  
      account
    else  
      nil 
    end  
  end  

end
