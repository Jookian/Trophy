class GoalsController < ApplicationController
   before_action :authenticate_user!
  def show
    @goal = Goal.find(params[:id])
    @badges = @goal.badges
    @validated_badges = current_user.user_badges.pluck(:badge_id)
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
