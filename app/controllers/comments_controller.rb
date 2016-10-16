class CommentsController < ApplicationController
  def create
   @post = Post.find(params[:post_id])
   @comment = @post.comments.create(comment_params)
   if @comment.save
     redirect_to @post
   else
     flash[:danger] = "Sorry, your coment is not valid. Please, try again."
     redirect_to @post


   end
end

   private

   def comment_params
        params.require(:comment).permit(:body, :post_id)
   end
end
