class DashboardController < ApplicationController
  before_action :authenticate_user!
  helper :goals

  def index
    @show_welcome_popup = session.delete(:show_welcome_popup)
    @user_goals = current_user.user_goals

    @goal_progress = @user_goals.map do |user_goal|
      goal = user_goal.goal
      total_badges = goal.badges.count
      validated_badges = current_user.user_badges.where(badge: goal.badges).count
       progress =
        if total_badges == 0
          0
        else
          ((validated_badges.to_f / total_badges) * 100).round
        end

      {
        user_goal: user_goal,
        goal: user_goal.goal,
        progress: progress
      }
    end
  end
end
