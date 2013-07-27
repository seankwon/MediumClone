class SessionsController < ApplicationController
  include SessionsHelper
  def new
    @user = User.new
  end

  def create
    @user = User.authenticate(user_params)
    if @user
      sign_in @user
      redirect_to @user, success: 'Successful login!'
    else
      redirect_to login_path, error: 'Sorry, wrong credentials!'
    end
  end

  private
    def user_params
      params.require(:user).permit(:email, :password)
    end
end
