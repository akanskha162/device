class PhotosController < ApplicationController
  def display
    @photos = current_member.profile.photos
  end  
end
