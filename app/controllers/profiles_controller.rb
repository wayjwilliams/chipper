class ProfilesController < ApplicationController

  before_action do
    if session[:user_id].present?
    else
      redirect_to sign_in_path
    end
  end

  def show
    @user = User.find_by username: params[:username]
    @users = User.all
  end

  def follow
  end

end
