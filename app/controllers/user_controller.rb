class UserController < ApplicationController
  include SessionsHelper
  before_filter :signed_in_user, :only => [:show]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: "Login successful!"
    else
      redirect_to user_new_path, flash: "Login fail"
    end
  end

  def show
    redirect_to root_path if params[:id].nil? 
    @user = User.find(params[:id])
  end

  private
    def user_params
      params.require(:user).permit!
    end
end
