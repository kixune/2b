class UsersController < ApplicationController
  before_action :set_user,        only: [:show, :edit, :update, :destroy]
  before_action :logged_in_rockhound, only: [:index, :show, :edit, :update]
  before_action :correct_rockhound,   only: [:edit, :update]

  #GET /users
  def index
    @users = User.all
  end

  #GET /users/1
  def show

  end

  #GET /users/new
  def new
    @user = User.new
  end

  #POST /users
  def create
  end

  #GET /users/1/edit
  def edit
  end

  #PATCH/PUT /users/1
  def update
  end

  #DELETE /users/1
  def destroy
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password,
    :password_confirmation)
  end

  def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in first!"
        redirect_to login_url
      end
    end

    def correct_user
      @user = User.find(params[:id])
      unless current_user?(@user) || current_user.admin_rights
        flash[:danger] = "Don't be lame!"
        redirect_to(root_url)
      end
    end


end
