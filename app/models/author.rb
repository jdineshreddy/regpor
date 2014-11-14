class Author < ActiveRecord::Base
  has_many :books
  belongs_to :book

  validates :name, presence:  true

end
