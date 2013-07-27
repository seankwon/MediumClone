class SessionsController < ApplicationController
  include SessionsHelper
  def new
    @user = User.new()
  end

  def create
    user = User.authenticate(user_params)
    if user
      sign_in user
      redirect_back_or user, flash[:notice] = "You have successfully signed in!"
    else
      render 'new', flash[:alert]= 'Sorry, wrong credentials!'
    end
  end

  private
    def sessions_params
      params.permit!
    end

    def user_params
      params.require(:user).permit!
    end
end
