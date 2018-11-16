class UsersController < ApplicationController

  def index
    @users = User.all

    render :index
  end

  def new
    @user = User.new
    render :new
  end

  def show
    @user = User.find(params[:id])
    render :show
  end

  def create
    @user = User.new(short_params)
    # debugger

    if @user.save
      login(@user)
      redirect_to users_url
    else
      flash[:errors] = @user.errors.full_messages
      # flash.now[:errors] = @user.errors.full_messages
      render :show
    end
  end

  def short_params
    params.require(:user).permit(:password, :email)
  end
end
