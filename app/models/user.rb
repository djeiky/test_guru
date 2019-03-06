class User < ApplicationRecord
  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :author, class_name: "Test", foreign_key: :author_id

  validates :username, presence: true

  def tests_by_level(level)
    self.tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
