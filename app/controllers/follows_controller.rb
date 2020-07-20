class FollowsController < ApplicationController

  def create
    if @user = User.find_by(follow_id: params[:follow_id])
      current_user.follow(@user)
      redirect_to :back
    else
      flash[:warming] = "user not found"
      redirect_to root_path
    end
  end

  def destroy
    @user.followed
    current_user.unfollow(@user)
    redirect_to :back
  end

end
