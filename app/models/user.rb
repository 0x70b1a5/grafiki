class User < ApplicationRecord
  attr_accessor :password
  attr_accessible :username, :email, :password, :password_confirmation

  EMAIL_REGEX = /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,10}\z/i

  validates :username, :presence => true, :uniqueness => true, 
    :length => { :in => 3..20 }
  validates :email, :presence => true, :uniqueness => true,
    :format => EMAIL_REGEX
  validates :password, :confirmation => true
  validates_length_of :password, :in => 10..50, :on => :create

  before_save :encrypt_password
  after_save :clear_password

  def encrypt_password
    if password.present?
      self.salt = BCrypt::Engine.generate_salt
      self.encrypted_password = BCrypt::Engine.hash_secret(password, salt)
    end
  end
  def clear_password
    self.password = nil
  end
end
