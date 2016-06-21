class Post < ActiveRecord::Base
  # include Bootsy::Container 
  
  belongs_to :member
  has_many :comments , dependent: :destroy
  has_many :likes, as: :likeable  
  
end

