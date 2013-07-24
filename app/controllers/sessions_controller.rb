class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate(sessions_params)
    if user
      cookies.permanent[:auth_token] = user.auth_token
      redirect_to root_url
    else
      render 'new'
    end
  end

  private
    def sessions_params
      params.permit!
    end
end
