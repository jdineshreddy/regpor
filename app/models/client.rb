class Client < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :customers_profile
  has_many :posts

  after_create :assign_clint_id
  private
  def assign_clint_id

  a=CustomersProfile.new(client_id: self.id)
  a.save!(validate: false)

  end
end
