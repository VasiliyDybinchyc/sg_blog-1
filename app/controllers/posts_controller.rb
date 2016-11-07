class PostsController < ApplicationController

  before_action :find_post, only: [:show, :edit, :destroy, :update]

  def index
    @posts = Post.latest_five
  end

  def show
    @comments = @post.comments
  end

  def new
    if logged_in?
      @post = Post.new
    else
      flash[:danger] = "Please sign up or log in"
      redirect_to root_path
    end
  end

  def edit
  end

  def destroy
    @post.destroy
    redirect_to "/"
  end

  def update
    @post.image = params[:image]
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

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body, :image)
  end

end
