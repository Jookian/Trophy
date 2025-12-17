class Goal < ApplicationRecord
  belongs_to :category
  has_many :user_goals
  has_many :badges
  has_many_attached :photos

  # Vérifie si un utilisateur a complété 100% des trophées classiques
  def completed_by?(user)
    return false if badges.visible.empty?

    validated_count = user.user_badges.where(badge: badges.visible).count
    validated_count == badges.visible.count
  end

  # Retourne le chemin de l'icône SVG basé sur le nom du goal
  def icon_path
    filename = name.parameterize + ".svg"
    "goal-icons/#{filename}"
  end
end
