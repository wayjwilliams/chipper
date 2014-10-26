class SessionsController < ApplicationController
  def new
  end

  def create
    username = params[:username]
    password = params[:password]

    user  = User.find_by username: username
    if user.password == password
      session[:user_id] = user.id
      redirect_to root_path
    else
      render :new
    end
  end

  def signout
    session[:user_id] = nil
    redirect_to root_path
  end

  def signup
    @user = User.new
  end

  def create_user
    @user = User.new(params.require(:user).permit(:username, :password, :password_confirmation))
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :signup
    end
  end
end
