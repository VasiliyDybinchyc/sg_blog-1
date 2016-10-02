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

  def edit
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to "/"
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      redirect_to(@post)
    else
      redirect_to edit_post_path, 
      :notice => "Sorry, your update is not valid. Please, try again."
    end
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_path(@post.id)
    else
      redirect_to new_post_path,
      :notice => "Sorry, your post is not valid. Please, try again."
    end
  end

  private
    def post_params
      params.require(:post).permit(:title, :body)
    end

end
