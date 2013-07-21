class UserController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if passwordConfirmation == params[:user][:password] && params[:user].each.any?
      redirect_to root
    else 
      redirect_to user_new_path
    end
  end

  private 
    def user_params
       params.require(:user).permit(:name, :email, :password)
    end
end
