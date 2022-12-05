class UsersController < ApplicationController
  before_action :get_user, only: [:show, :edit, :update, :destroy]
  before_action :require_user, only: [:edit, :update]
  before_action :check_same_user, only: [:edit, :update, :destroy]

  def index
    @users = User.paginate(page: params[:page], per_page: 3)
  end

  def show
    @all_articles = @user.articles
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "#{@user.username} update success"
      redirect_to @user
    else
      render "edit"
    end
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
      session[:user_id] = @user.id
      flash[:notice] = "#{@user.username} User create success"
      redirect_to @user
    else
      render :new
    end
  end

  def destroy
    @user.destroy
    session[:user_id] = nil if @user == current_user
    flash[:notice] = "Account and articles successfully deleted"
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def get_user
    @user = User.find(params[:id])
  end

  def check_same_user
    if current_user != @user && !current_user.admin?
      flash[:alert] = "You are not able to edit this profile"
      redirect_to @user
    end
  end
end
