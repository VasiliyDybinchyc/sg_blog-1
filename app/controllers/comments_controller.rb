class CommentsController < ApplicationController

  before_action :find_post_id

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
end
