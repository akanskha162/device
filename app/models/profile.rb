class Profile < ActiveRecord::Base
  belongs_to :member 
  has_many :photos
 mount_uploader :image, ImageUploader
end
