class Member < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:omniauthable, :omniauth_providers => [:facebook,:google_oauth2, :twitter]

   # attr_accessible :login


  has_one :profile
  has_many :posts 
  has_many :likes  

  def login
    @login || self.username || self.email
  end
  
  def already_likes?(post)
   if post.likes.where(:member_id=>self.id).blank?
    return false
   else 
    return true
   end
  end

 attr_accessor :current_password
  # def self.find_for_database_authentication(warden_conditions)
     
  #    conditions = warden_conditions.dup
  #    #where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
  #    Member.where(["username =  ? OR lower(email) = ?", login,login }]).first

  #    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
  #      where(conditions.to_h).first
  #   end
  #  end

end
