class BandsCotroller < ApplicationController
  before_action :require_log_in
  def index
    @bands = Band.all

    render :index
  end

  def new
    @band = Band.new
    render :new
  end

  def show
    @band = Band.find(params[:id])
    render :show
  end

  def create
    @band = Band.new(short_params)
    @band.user_id = current_user.id
    # debugger
    if @band.save
      redirect_to bands_url
    else
      flash[:errors] = @band.errors.full_messages
      # flash.now[:errors] = @user.errors.full_messages
      render :show
    end
  end

  def short_params
    params.require(:band).permit(:user_id, :name)
  end
end
