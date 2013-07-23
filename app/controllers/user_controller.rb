class UserController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    passwordCon = params[:password_confirmation]
    if params[:user][:password] == passwordCon
      params[:user].each do |p|
        redirect_to user_new_path if p.empty?
      end
      @user.save!
      redirect_to root_path
    else
      redirect_to user_new_path
    end
  end

  private
    def user_params
      params.require(:user).permit!
    end
end
