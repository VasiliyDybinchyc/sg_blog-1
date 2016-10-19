class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    @comment.save
 end

   def edit
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
  end

  def update
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    if @comment.update(comment_params)
      redirect_to @post
    else
      flash[:notice] = "Sorry, your coment is not valid. Please, try again."
      redirect_to(:back)
    end
  end

   private

   def comment_params
        params.require(:comment).permit(:body)
   end
end
