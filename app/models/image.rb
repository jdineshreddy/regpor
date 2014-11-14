class Image < ActiveRecord::Base

  belongs_to :book
  mount_uploader :img, ImageUploader

  validates :img, presence: true

end
