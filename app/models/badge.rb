class Badge < ApplicationRecord
  belongs_to :goal
  has_many :user_badges, dependent: :destroy

  # Scopes pour distinguer les trophées
  scope :visible, -> { where(hidden: false) }
  scope :hidden, -> { where(hidden: true) }
end
