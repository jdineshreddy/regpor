require 'bcrypt'

class Customer < ActiveRecord::Base
  has_many :posts
  has_one :customers_profile
  accepts_nested_attributes_for :customers_profile

  attr_accessor :password,:password_confirmation

before_save :encrypt_password

  def encrypt_password
    if password.present?
    self.password_salt = BCrypt::Engine.generate_salt
    self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
  def self.authenticate(username,password)
    customer=find_by_username(username)

       if customer && customer.password_hash == BCrypt::Engine.hash_secret(password,customer.password_salt)
         customer
       else
         nil
       end
  end

  validates :username,presence: true, length: {in: 3..14,message: 'Username already exists'}, uniqueness: true,
             format: { with: /\A[a-zA-Z0-9]+\Z/, message: "allows only letters and number without any special characters and space" }
  validates :password, confirmation: true,length: {in: 6..14,message: 'atleast 6 characters'}
  validates :password_confirmation, presence: true

end

