class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user

    # Trophées remportés
    @user_badges = @user.user_badges
    @trophies_count = @user_badges.count

    # Objectifs complétés (100% des 5 trophées)
    @completed_goals = @user.user_goals.includes(:goal).select do |user_goal|
      user_goal.goal.completed_by?(@user)
    end.map(&:goal)
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user

    if @user.update(user_params)
      redirect_to profile_path, notice: "Profil mis à jour"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :name,
      :motivation_text,
      :photo
    )
  end
end
