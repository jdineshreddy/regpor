class CustomersProfile < ActiveRecord::Base
  belongs_to :customer

  validates :fname, presence: true, format: { with: /[a-zA-Z]+/, message: "only allows letters" }
  validates :lname, presence: true, format: { with: /[a-zA-Z]+/,message: "only allows letters" }
  validates :dob, :presence => {message: ':YYYY-MM-DD' }
  validates :gender, :presence => {message: ' :select your "GENDER"'}
  validates :mobile,presence: true,numericality: true, length: {minimum: 10, maximum: 10},
            format: {with: /\d{10}/}
  validates :email,format: { with: /\A[^@\s]+@([^@.\s]+\.)*[^@.\s]+\z/ }
end
