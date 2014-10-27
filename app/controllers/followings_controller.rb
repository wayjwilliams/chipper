class FollowingsController < ApplicationController

  def create
    @following = current_user.followings.build(:follower_id => params[:follower_id])
    if @following.save
      redirect_to root_path, notice: "Following!"
    else
      redirect_to root_path, error: "Error occurred, retry!"
    end
  end

  def destroy
    @following = current_user.followings.find(params[:id])
    @following.destroy, notice: "Unfollowed!"
    redirect_to current_user
  end

end
