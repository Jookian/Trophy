class Goal < ApplicationRecord
  belongs_to :category
  has_many :user_goals
  has_many :badges
  has_many_attached :photos

  # Génère le chemin de l'icône SVG basé sur le nom
  def icon_filename
    name.downcase
        .gsub(/['']/, '')
        .gsub(/[àâä]/, 'a')
        .gsub(/[éèêë]/, 'e')
        .gsub(/[îï]/, 'i')
        .gsub(/[ôö]/, 'o')
        .gsub(/[ùûü]/, 'u')
        .gsub(/ç/, 'c')
        .gsub(/\s+/, '-')
        .gsub(/[^a-z0-9\-]/, '')
        .gsub(/-+/, '-')
        .gsub(/^-|-$/, '') + '.svg'
  end

  def icon_path
    "goal-icons/#{icon_filename}"
  end

  # Vérifie si l'utilisateur a complété 100% des trophées classiques (non-cachés)
  def completed_by?(user)
    visible_badges = badges.visible
    return false if visible_badges.empty?

    user.user_badges.where(badge: visible_badges).count == visible_badges.count
  end
end
