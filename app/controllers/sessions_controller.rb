class SessionsController < ApplicationController
  def new
  end

  def create
    username = params[:username]
    password = params[:password]

    user  = User.find_by username: username
    if user.password == password
      session[:user] = user.id
      redirect_to rooth_path
    else
      render :new
    end
  end

  def signout
    session[:user_is] = nil
    redirect_to rooth_path
  end

  def signup
    @user = User.new
  end

  def create_user
    @user = User.new(params.require(:user).permit(:username, :password, :password_confirmation))
    if @user.save
      session[:user_id] = @user.id
      redirect_to root-path
    else
      render :signup
    end
  end
end
