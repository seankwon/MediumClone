class PostController < ApplicationController
  include SessionsHelper
  before_filter :signed_in_user, :only => [:new, :create]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @user, success: 'Post creation successful!'
    else
      redirect_to newpost_path, error: 'Post failed'
    end
  end

  def update
  end

  private 
    def post_params
      params.require(:post).permit!
    end
end
