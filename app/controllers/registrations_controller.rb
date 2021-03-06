class RegistrationsController < Devise::RegistrationsController
  def create
    
    build_resource(sign_up_params)
    resource.save
    yield resource if block_given?
    if resource.persisted?
      resource.build_profile(first_name:params[:first_name],last_name:params[:last_name], city:params[:city]).save
      resource.add_role("employee")
      if resource.active_for_authentication?
        # set_flash_message! :notice, :signed_up
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        # set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end 
  end

  protected
    def update_resource(resource, params) 

      if params[:password].blank? && params[:password_confirmation].blank?
        resource.update_without_password(params)
      else
        super
      end
    end
end






    
  
