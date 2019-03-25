class Badge < ApplicationRecord
  belongs_to :badge_type
  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges

  validates :name, presence: true
end
