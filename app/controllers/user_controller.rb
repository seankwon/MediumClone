class UserController < ApplicationController
  include SessionsHelper
  include PgHelper
  before_filter :signed_in_user, :only => [:show, :edit, :update]
  before_filter :correct_user, :only => [:show, :edit]

  def new
    @user = User.new
    @url = 'user/create'
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, success: "Creation successful!"
    else
      redirect_to user_new_path, error: "Login fail"
    end
  end

  def show
    @user = User.find(params[:id])
    @posts = find_posts_by_user_id @user.id
    @editing = true if signed_in?
  end

  def edit
    @user = User.find(params[:id])
    @url = '/user/' + params[:id]
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to @user, success: 'Editing successful!'
    else
      redirect_to edit_user_path(@user.id), error: 'Editing failed!'
    end
  end

  private
    def user_params
      params.require(:user).permit!
    end

end
