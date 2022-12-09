class RelationshipsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    current_user.follower(@user)
    redirect_to request.referer
  end
  def destroy
    @user = User.find(params[:user_id])
    current_user.unfollower(@user)
    redirect_to request.referer
  end
  def following
    user = User.find(params[:id])
    @followings = user.fllowings
  end
  def follower
    user = User.find(params[:id])
    @followings = user.fllowers
  end
end
