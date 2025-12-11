class GoalsController < ApplicationController
   before_action :authenticate_user!
  def show
    @goal = Goal.find(params[:id])
    @badges = @goal.badges
    @validated_badges = current_user.user_badges.pluck(:badge_id)
  end
end
