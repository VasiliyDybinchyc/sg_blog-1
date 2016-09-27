class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to "/post/#{@post.id}"
    else
      redirect_to "/NewPost", :notice => "Sorry, your post is not valid. Please, try again."
    end
  end

  private
    def post_params
      params.require(:post).permit(:title, :body)
    end

end
