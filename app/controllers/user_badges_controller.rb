class UserBadgesController < ApplicationController
  before_action :authenticate_user!

  def create
    badge = Badge.find(params[:badge_id])

    unless current_user.user_badges.exists?(badge: badge)
      current_user.user_badges.create(badge: badge)
    end

    redirect_to goal_path(badge.goal), notice: "trophy_unlocked"
  end

  def destroy
    user_badge = current_user.user_badges.find(params[:id])
    goal = user_badge.badge.goal

    user_badge.destroy

    redirect_to goal_path(goal), notice: "Trophy_locked"
  end

end

