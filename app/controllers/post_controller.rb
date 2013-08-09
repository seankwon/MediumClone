class PostController < ApplicationController
  include SessionsHelper
  before_filter :signed_in_user, :only => [:new, :create, :edit]

  def new
    @post = Post.new
    @url = '/post/create'
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to user_path(current_user.id), success: 'Post creation successful!'
    else
      redirect_to newpost_path, error: 'Post failed!'
    end
  end

  def show
    @post = Post.find_by id: params[:id]
    @user = User.find_by id: @post.user_id
  end

  def edit
    @post = Post.find_by id: params[:id]
    @url = '/post/' + params[:id]
  end

  def update
    @post = Post.find_by id: params[:id]
    if @post.update_attributes(post_params)
      redirect_to @post, success: 'Editing successful!'
    else
      redirect_to edit_post_path(@post.id), error: 'Editing failed!'
    end
  end

  private 
    def post_params
      params.require(:post).permit!
    end
end
