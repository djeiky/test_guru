class Gist < ApplicationRecord
  belongs_to :question
  belongs_to :user

  validates :question, presence: true
  validates :user, presence: true
  validates :url, presence: true

  def hash
    url.split("/").last
  end
end
