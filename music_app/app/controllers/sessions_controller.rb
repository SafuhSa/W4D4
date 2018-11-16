class SessionsController < ApplicationController
# before_action :re

  def new
    @user = User.new
    render :new
  end

  def destroy
    logout
    redirect_to new_session_url
  end

  def create
    @user = user.find_by_credentials(params[:user][:username], params[:user][:password])

    if @user
      login(@user) #<<re-set the appropriate user's session_token and session[:session_token]
      redirect_to user_url(@user)
    else

      
      flash[:errors] = ["try again, username or password not valid"]
      redirect_to new_session_url
    end
  end
end
