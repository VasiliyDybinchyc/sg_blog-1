class CommentsController < ApplicationController

  before_action :find_post_id
  before_action :logged_in_user

  def create
    @comment = @post.comments.create(comment_params)
    @comment.save
  end

  def edit
    @comment = @post.comments.find(params[:id])
  end

  def update
    @comment = @post.comments.find(params[:id])
    @comment.update(comment_params)
  end

   private

     def find_post_id
       @post = Post.find(params[:post_id])
     end

     def comment_params
        params.require(:comment).permit(:body)
     end

     def logged_in_user
       unless logged_in?
         flash[:danger] = "Please sign up or log in."
         redirect_to root_path
       end
     end
end
