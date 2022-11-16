class UsersController < ApplicationController
  before_action :get_user, only: [:show]

  def show
  end

  def new
    @user = User.new
  end

  def create
    # p params[:user]
    # # debugger
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      flash[:notice] = "#{@user.username}User create success"
      redirect_to @user
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def get_user
    @user = User.find(params[:id])
  end
end
