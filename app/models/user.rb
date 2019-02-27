class User < ApplicationRecord
  has_many :user_tests

  def tests(level)
    tests = Test.find_by(level: level)
    self.user_tests.find_by(test_id: tests)
  end
end
