class Goal < ApplicationRecord
  belongs_to :category
  has_many :user_goals
  has_many :badges
  has_many_attached :photos
end
