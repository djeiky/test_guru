class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :max_answers

  scope :correct, -> {where(correct: true)}

private
  def max_answers
    errors.add(:question, "Answers can't be more than 4") if question.answers.count >= 4
  end
end
