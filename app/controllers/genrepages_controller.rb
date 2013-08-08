class GenrepagesController < ApplicationController
  include SessionsHelper
  include PgHelper
  def home
    @posts = find_all_posts
  end
end
