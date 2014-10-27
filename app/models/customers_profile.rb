class CustomersProfile < ActiveRecord::Base
  belongs_to :customer

  def send_password_reset
    generate_token(:password_reset_token)

    self.password_reset_sent_at = Time.zone.now
    save!
    CustomerMailer.pw_change(self).deliver
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while Customer.exists?(column => self[column])
  end


  validates :fname, presence: true, format: { with: /[a-zA-Z]+/, message: "only allows letters" }
  validates :lname, presence: true, format: { with: /[a-zA-Z]+/,message: "only allows letters" }
  validates :dob, :presence => {message: ':YYYY-MM-DD' }
  validates :gender, :presence => {message: ' :select your "GENDER"'}
  validates :mobile,presence: true,numericality: true, length: {minimum: 10, maximum: 10},
            format: {with: /\d{10}/}
  validates :email,uniqueness: true, format: { with: /\A[^@\s]+@([^@.\s]+\.)*[^@.\s]+\z/ }
end
