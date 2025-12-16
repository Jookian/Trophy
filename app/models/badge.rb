class Badge < ApplicationRecord
  belongs_to :goal
  has_many :user_badges, dependent: :destroy

end
