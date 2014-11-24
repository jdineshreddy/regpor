class Post < ActiveRecord::Base
  belongs_to :customer
  belongs_to :client
end
