class PostsController < ApplicationController
  include SessionsHelper
  before_filter :signed_in_user

  def new
    @post = Post.new
  end

end
