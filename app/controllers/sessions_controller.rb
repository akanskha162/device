class SessionsController < Devise::SessionsController
  def new
    super
  end
  
  def create     
    member = Member.where('username=? OR email=? OR mobile_no=?',params[:member][:login],params[:member][:login],params[:member][:login]).first
    
    if member && member.valid_password?(params[:member][:password])
      sign_in(member)
      redirect_to show_path 
    else
      flash[:notice] = "invalid user"
      redirect_to new_member_registration_path  
    end
  end
 
end
