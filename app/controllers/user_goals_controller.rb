class UserGoalsController < ApplicationController
  def create
    goal_ids = params[:goal_ids] # un array : ["1", "4", "7"]

    if goal_ids.present?
      goal_ids.each do |goal_id|
        current_user.user_goals.find_or_create_by(goal_id: goal_id)
      end
      redirect_to goal_path(goal_ids.first), notice: "Objectifs ajoutés."
    else
      redirect_to dashboard_path, alert: "Aucun objectif sélectionné."
    end
  end

  def destroy
    user_goal = current_user.user_goals.find(params[:id])
    user_goal.destroy

    redirect_to dashboard_path, notice: "Objectif supprimé" 
  end
end
