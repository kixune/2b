class ChestsController < ApplicationController
  before_action :set_chest, only: [:show,  :update, :destroy]
  before_action :logged_in_user, only: [:index, :show]

  def index
  end

  def new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
