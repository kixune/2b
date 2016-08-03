class UsersController < ApplicationController


  #GET /users
  def index
    @users = User.all
  end

  #GET /users/1
  def show
    @user = User.find(params[:id])
  end

  #GET /users/new
  def new
    @user = User.new

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

  def user_params
    params.require(:user).permit(:name, :email, :password,
    :password_confirmation)
  end
end
