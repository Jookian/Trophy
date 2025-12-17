module ApplicationHelper
  def current_user_trophies_validated
    return 0 unless current_user
    current_user.user_badges.count
  end

  def current_user_trophies_total
    return 0 unless current_user
    Badge.joins(goal: :user_goals).where(user_goals: { user_id: current_user.id }).visible.count
  end
end
