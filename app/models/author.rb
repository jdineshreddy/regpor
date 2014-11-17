class Author < ActiveRecord::Base
  has_many :books
  belongs_to :book

  validates :author_name, presence:  true , format: { with: /\A[a-zA-Z\d\s]*\z/, message: "Special Characters not allowed only space allowed" }

end
