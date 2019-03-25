class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
          :registerable,
          :recoverable,
          :rememberable,
          :validatable,
          :trackable,
          :confirmable

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :author, class_name: "Test", foreign_key: :author_id
  has_many :gists
  has_many :user_badges
  has_many :badges, through: :user_badges

  validates :email, presence: true, uniqueness: true
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

  def success_tests
    tests.where(test_passages: {passed: true})
  end

  def greet_user
    "Hello #{self.last_name.present? ? self.last_name : self.email}"
  end

  def tests_by_level(level)
    self.tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def admin?
    is_a?(Admin)
  end
end
