class ShowController < ApplicationController

  def ShowPost
    @post = Post.find(params[:id])
  end

end
