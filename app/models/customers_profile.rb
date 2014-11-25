class CustomersProfile < ActiveRecord::Base
  belongs_to :customer
  belongs_to :client


  before_validation :perform_action


  validates :fname, presence: true, format: { with: /[a-zA-Z]+/, message: "only allows letters" }
  validates :lname, presence: true, format: { with: /[a-zA-Z]+/,message: "only allows letters" }
  validates :dob, :presence => {message: ':YYYY-MM-DD' }
  validates :gender, :presence => {message: ' :select your "GENDER"'}
  validates :mobile,presence: true,numericality: true, length: {minimum: 10, maximum: 10},
            format: {with: /\d{10}/}

  private
  def perform_action
    @profile=CustomersProfile.all
    @profile.each do |p|
      next if(p.id==self.id)
      if(self.fname == p.fname)
        if(self.lname == p.lname)
          errors.add(:name, ": Another customer exists with same 'First Name' and 'Last Name' ")
        end
      end
    end
  end






  def self.search(query)
    if query
      where('fname LIKE  ? OR lname LIKE?', "%#{query}%", "%#{query}%")
    else
      all
    end
  end
end
