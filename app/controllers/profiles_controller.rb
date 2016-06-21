class ProfilesController < ApplicationController

  def show

   
  end

  def create
   @profile = current_member.build_profile(params[:profile].permit!)
   @profile.save
   redirect_to display_path
  end

  def show_form
    @profile = current_member.profile
    if @profile.present?
      @profile = current_member.profile
       @url = update_path
    else
       @profile = current_member.build_profile
       @url = create_path
    end
  end

  def update 

   @profile = current_member.profile.update(params[:profile].permit(:city ,:address,:last_name,:first_name))
   @profile = current_member.profile
   #@profile.update(params[:profile].permit!)
        # respond_to do |format|
        # if @profile
        #   format.js
        # end 
       @photos = params[:profile][:image]
         @photos.each do |p|
          current_member.profile.photos.create(photo:p)
        end
        redirect_to display_path
        @images = current_member.profile.photos


        # redirect_to display_path
      # end
      # redirect_to display_path
      #   status = @profile ? 'form successfully updated' : 'an error has occurred'
      #   respond_to do |format|
      #     format.js
      #     format.json {render json: {status: status}}      
      #   end
   end

end