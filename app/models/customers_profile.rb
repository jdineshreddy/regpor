class CustomersProfile < ActiveRecord::Base
  belongs_to :customer
  belongs_to :client




  validates :fname, presence: true, format: { with: /[a-zA-Z]+/, message: "only allows letters" }
  validates :lname, presence: true, format: { with: /[a-zA-Z]+/,message: "only allows letters" }
  validates :dob, :presence => {message: ':YYYY-MM-DD' }
  validates :gender, :presence => {message: ' :select your "GENDER"'}
  validates :mobile,presence: true,numericality: true, length: {minimum: 10, maximum: 10},
            format: {with: /\d{10}/}



  def self.search(query)
    if query
      where('fname LIKE  ? OR lname LIKE?', "%#{query}%", "%#{query}%")
    else
      all
    end
  end
end
