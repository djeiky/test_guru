class Question < ApplicationRecord
  belongs_to :test
  has_many :answers

  validates :body, presence: true
  validate :max_answers

private
  def max_answers
    count = self.answers.count
    errors.add(:answers, "Too much answers only 1 to 4 answers for question") if count > 4
  end
end
