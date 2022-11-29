class SessionsController < ApplicationController
  def index
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = "cool"
      redirect_to user
    else
      flash.now[:alert] = "There was some error on credentials"
      render "index"
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Logged Out"
    redirect_to root_path
  end
end
