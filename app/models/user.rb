class User < ApplicationRecord
  has_many :user_tests
  has_many :tests, through: :user_tests
  has_many :author, class_name: "Test", foreign_key: :author_id

  def tests_by_level(level)
    self.tests.where(level: level)
  end
end
