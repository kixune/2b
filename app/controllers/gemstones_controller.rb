class GemstonesController < ApplicationController
  before_action :set_gemstone, only: [:show,  :update, :destroy]
  before_action :logged_in_user, only: [:index, :show]



  def index
    @gemstones = Gemstone.all
  end

  def new
    @gemstone = Gemstone.new
  end

  def create
    @current_user = current_user
    @gemstone =  @current_user.gemstones.create(gemstone_params)
    if @gemstone.save

      redirect_to @gemstone
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

    def set_gemstone
      @gemstone = Gemstone.find(params[:id])
    end

    def gemstone_params
      params.require(:gemstone).permit(:name, :version, :summary)
    end

    def logged_in_user
      unless logged_in?
        redirect_to login_url
      end
    end

end
