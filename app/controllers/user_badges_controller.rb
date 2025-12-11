class UserBadgesController < ApplicationController
  before_action :authenticate_user!

  def create
    badge = Badge.find(params[:badge_id])

    unless current_user.user_badges.exists?(badge: badge)
      current_user.user_badges.create(badge: badge)
    end

    redirect_to goal_path(badge.goal), notice: "Badge validé 🎉"
  end
end

