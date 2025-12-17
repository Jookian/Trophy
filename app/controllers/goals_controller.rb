class GoalsController < ApplicationController
   before_action :authenticate_user!
  def show
    @goal = Goal.find(params[:id])
    @badges = @goal.badges.visible
    @hidden_badges = @goal.badges.hidden
    @validated_badges = current_user.user_badges.pluck(:badge_id)
    @goal_completed = @goal.completed_by?(current_user)

    # Récupère le dernier badge débloqué par l'utilisateur pour ce goal
    @badge = current_user.user_badges
                         .where(badge_id: @goal.badges.pluck(:id))
                         .order(created_at: :desc)
                         .first&.badge

    # Les trophées cachés ne s'affichent que si l'objectif est complété
    @show_hidden_badges = @goal_completed
    # Si popup affichée, les badges cachés seront masqués par CSS et révélés au clic OK
    @hide_hidden_initially = flash[:notice] == 'trophy_unlocked'
  end

  def add_photos
  @goal = current_user.goals.find(params[:id])

  if params[:photos].present?
    params[:photos].each do |photo|
      begin
        # On force l'attach, même formats inconnus
        @goal.photos.attach(photo)
      rescue => e
        Rails.logger.warn("Impossible d'attacher #{photo.original_filename}: #{e.message}")
        next
      end
    end
  end

  redirect_to goal_path(@goal)
end

  def gallery
    @goal = current_user.goals.find(params[:id])
  end

  def destroy_photo
    @goal = current_user.goals.find(params[:id])
    photo = @goal.photos.find(params[:photo_id])
    photo.purge
    redirect_to "/goals/#{@goal.id}/gallery"
  end
end
