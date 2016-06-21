class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  before_action :set_auth

  def facebook
    @member = get_member  
    @member.update(facebook_uid: @auth.uid,facebook_oauth_token: @auth.credentials.token) if @member.id.present?
    create_member :facebook unless @member.id.present?
    build_profile
    signin_and_redirect
  end

  def google_oauth2
    @member = get_member
    @member.update(uid: @auth.uid, oauth_token: @auth.credentials.token) if @member.id.present? 
    create_member :google_oauth2 unless @member.id.present?
    build_profile
    signin_and_redirect
  end 
  
  def twitter
    @member = Member.where(provider: @auth[:provider], uid: @auth[:uid]).first_or_initialize
    @member.oauth_token = @auth.credentials.token if @member.id.present?
    @member.save(validate:false)
    @member.build_profile(name: @auth.info.name, nickname: @auth.info.nickname,image:@auth.info.image).save
    signin_and_redirect
  end

  private
    def build_profile
      @member.build_profile(first_name: @auth.info.first_name, last_name: @auth.info.last_name, image: @auth.info.image).save
    end

    def create_member provider
      case provider
      when :facebook
        @member.facebook_uid = @auth[:uid]
        @member.facebook_oauth_token = @auth[:credentials_token]
      when :google_oauth2
        @member.uid = @auth[:uid]
        @member.oauth_token = @auth[:credentials_token]      
      when :twitter
      end
      @member.save(validate:false)
      build_profile
    end

    def get_member
      Member.where(email: @auth[:info][:email]).first_or_initialize
    end

    def set_auth
      @auth = env["omniauth.auth"]
    end

    def signin_and_redirect
      sign_in(@member)
      redirect_to root_path
    end
end