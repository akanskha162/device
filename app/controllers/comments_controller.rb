class CommentsController < ApplicationController
  def new
   
    @post = current_member.posts.find(params[:post_id])
   # @comments = @post.comments.order(created_at: :asc).paginate(:page => params[:page], :per_page => 5)
  end

  def index
    @post= current_member.posts.find(params[:post_id])
    @comments = @post.comments.order(created_at: :asc)
  end
   
  def show  
  end

  def create  
    @posts = current_member.posts.find(params[:post_id])
    @comment = @posts.comments.create(params[:comment].permit!)
    #redirect_to post_comments_path(@posts.id)
  end
  
  def destroy     
    @post = current_member.posts.find(params[:post_id])
    @comment= @post.comments.find(params[:id])
    @comment.destroy 
    #redirect_to post_comments_path(@post.id)
  end

  def likes

    @post= Post.find(params[:post_id])
    @comment= @post.comments.find(params[:comment_id]) 
    @like= @comment.likes.where(member_id:current_member.id).first
      if @like.present?
         @like.destroy
      else
        @comment.likes.create(member_id:current_member.id) 
      end
      #redirect_to post_comments_path(@post) 
  end

  

  # def
  #   before_action do
  #   @comment = Comment.find(params[:comment_id])
  # end

  def reply_index
    @comment = Comment.find(params[:comment_id])
    @replies = @comment.replies
    @reply = @comment.replies.new
  end

  def reply_new
  
    @comment = Comment.find(params[:comment_id])
    #@reply = @comment.replies.new
  end

  def reply_create

    @comment = Comment.find(params[:comment_id])
    @reply = @comment.replies.new(params[:reply].permit!).save
    
  end  

end
