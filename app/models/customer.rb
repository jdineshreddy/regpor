
require 'bcrypt'
class Customer < ActiveRecord::Base

  has_many :posts
  has_one :customers_profile
  accepts_nested_attributes_for :customers_profile
  attr_accessor :password,:password_confirmation
  before_save :encrypt_password


  validates :username,presence: true, length: {in: 3..14,message: 'Username already exists'}, uniqueness: true,
            format: { with: /\A[a-zA-Z0-9]+\Z/, message: "allows only letters and number without any special characters and space" }
  validates :email,uniqueness: true, format: { with: /\A[^@\s]+@([^@.\s]+\.)*[^@.\s]+\z/ }
  validates :password, confirmation: true,length: {in: 6..14,message: 'atleast 6 characters'}
  validates :password_confirmation, presence: true



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

  def send_password_reset
    generate_token(:password_reset_token)
    save(validate: false)
    CustomerMailer.pw_change(self).deliver
  end
  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while Customer.exists?(column => self[column])
  end

end



