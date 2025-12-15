class User < ApplicationRecord
  has_many :user_goals
  has_many :user_badges
  has_many :badges, through: :user_badges
  has_many :goals, through: :user_goals
  has_one_attached :photo
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
