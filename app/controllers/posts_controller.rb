class PostsController < ApplicationController
  def new
  end

  def index
    redirect_to new_member_session_path and return if current_member.blank?
    @total = Like.where(member_id:current_member.id).count 
     @posts = current_member.posts.order(created_at: :desc).paginate(:page => params[:page], :per_page => 5)
  
  end
  
  def search
   
    respond_to do |format|
     if Post.where("text LIKE ?", "%#{params[:val]}%").present?
      format.js{ @posts = Post.where("text LIKE ?", "%#{params[:val]}%") }
      else
        flash[:notice] = "there is no such posts"
          redirect_to :back
      end  
    end
  end
           
  def show
  end

  def create
    @member = current_member.posts.create(params[:post].permit(:text, :content, :bootsy_image_gallery_id))
   # redirect_to posts_path
  end 
  
  def edit
    @post = current_member.posts.find(params[:id])
    if current_member.posts.present?
      @find = @post
      @url = post_path
    else
      @find = current_member.posts.new
      @url = posts_path
    end 
  end

  def update
    @post = current_member.posts.find(params[:id])
    @post.update(params[:post].permit!)
    #redirect_to posts_path
  end
  
  def destroy
    @post = current_member.posts.find(params[:id])
    @post.destroy
    #redirect_to posts_path    
  end

  def like  
    @post = Post.find(params[:id])
    @like =  @post.likes.where(member_id:current_member.id).first
    if @like.present?
      @like.destroy
    else
       @like = @post.likes.create(:member_id=>current_member.id)
    end
    #redirect_to posts_path
  end
   
  def download
   
    @posts = Post.all
      respond_to do |format|
         format.html do
          render pdf: "akanaksha", template: "posts/download.html.erb",
               locals: {:posts => @posts}
        
      end
     end 
  end 
   
 end