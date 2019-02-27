class Test < ApplicationRecord
  belongs_to :category
  belongs_to :user_tests
  has_many :questions

  def self.tests_by_category(category)
    category = Category.find_by(title: category)
    Test.where(category_id: category.id).order(id: :desc)
  end
end
