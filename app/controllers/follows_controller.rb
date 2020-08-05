# frozen_string_literal: true

class FollowsController < ApplicationController
  def create
    if @user = User.find_by(id: params[:format])
      current_user.follow(@user)
    else
      flash[:warming] = "user not found"
    end
      redirect_back fallback_location: root_path
  end

  def destroy
    if @user = Follow.find_by(followed_id: params[:format])
      current_user.unfollow(@user)
    else
      flash[:warming] = "user not found"
    end
      redirect_back fallback_location: root_path
  end
end
