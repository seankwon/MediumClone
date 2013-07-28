class UserController < ApplicationController
  include SessionsHelper
  before_filter :signed_in_user, :only => [:show]
  def new
    @user = User.new
    @url = 'user/create'
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, success: "Creation successful!"
    else
      redirect_to user_new_path, flash: "Login fail"
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    @url = 'user_create_path'
  end

  private
    def user_params
      params.require(:user).permit!
    end
end
