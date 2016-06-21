class Photo < ActiveRecord::Base
  belongs_to :profile
  mount_uploader :photo, PhotoUploader
end