class Test < ApplicationRecord
  belongs_to :category
  has_many :user_tests
  has_many :users, through: :user_tests
  has_many :questions
  belongs_to :author, class_name: "User", foreign_key: :author_id

  validates :category, presence: true
  validates :title, presence: true, uniqueness: {scope: :level}
  validates :level, presence: true, numericality: {:greater_of => 0}

  scope :easy, -> {where(level: [0,1])}

  scope :medium, -> {where(level: [2..4])}

  scope :hard, -> {where(level: [5..Float::INFINITY])}

  def self.tests_by_category(category)
    Test.joins(:category).where(categories: {title: category}).order(id: :desc)
  end
end
