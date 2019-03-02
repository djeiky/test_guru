class Test < ApplicationRecord
  belongs_to :category
  has_many :user_tests
  has_many :users, through: :user_tests
  has_many :questions
  belongs_to :author, class_name: "User", foreign_key: :author_id

  def self.tests_by_category(category)
    Test.joins(:category).where(categories: {title: category}).order(id: :desc)
  end
end
