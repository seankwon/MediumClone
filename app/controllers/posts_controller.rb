class PostsController < ApplicationController
  include SessionsHelper
  before_filter :signed_in_user, :only => [:new]

  def new
    @post = Post.new
  end

  def show

  end

  def create

  end

  def update

  end

end
