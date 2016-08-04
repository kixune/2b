class UsersController < ApplicationController
  before_action :set_user,        only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:index, :show, :edit, :update]
  before_action :correct_user,   only: [:edit, :update]

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
    @user = User.new(user_params)

    if @user.save
      log_in @user
      redirect_to @user
    else
      render 'new'
    end
  end

  #GET /users/1/edit
  def edit
  end

  #PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  #DELETE /users/1
  def destroy
    @user.destroy
    respond_to do |format|
    format.html { redirect_to users_url, notice: 'user was successfully destroyed.' }
    format.json { head :no_content }
  end
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
