class UsersController < ApplicationController
  before_action :logged_in_user, except: [:new, :show, :create ]
  def new
  end
  private
  def logged_in_user
    unless user_signed_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end
end
