class CheepsController < ApplicationController

  before_action do
    if session[:user_id].present?
    else
      redirect_to sign_in_path
    end
  end

  def index
    @users = User.all
    @cheeps = current_user.cheeps.order("created_at desc")
    @cheep = Cheep.new
  end

  def post
    @post = Cheep.new(params.require(:thought).permit(:cheep_talk))
    @post.user = current_user
    if @post.user = current_user
      if @post.save
        redirect_to root_path
      else
        render :index
      end
    end
  end

end
