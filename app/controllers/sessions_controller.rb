class SessionsController < ApplicationController
  include SessionsHelper
  def new
  end

  def create
    user = User.authenticate(sessions_params)
    if user
      sign_in(user)
      redirect_to profile_path(user.id)
    else
      render 'new'
    end
  end

  private
    def sessions_params
      params.permit!
    end
end
