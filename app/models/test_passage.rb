class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create

  PERCENTS_SUCCESS = 85

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    self.current_question = next_question
    save!
  end

  def completed?
    current_question.nil?
  end

  def success?
    time_left >= 0 && percent >= PERCENTS_SUCCESS
  end

  def percent
    correct_questions * 100 / test.questions.count
  end

  def question_number
    test.questions.any? ? test.questions.order(id: :asc).index(current_question) + 1 : 0
  end

  def set_passed
    self.current_question = nil
    self.passed = success? ? true : false
    
    #if success?
    #  self.passed = true
    #end
    save!
  end

  def time_left
    created_at + test.time_to_pass - Time.now
  end

private
  def before_validation_set_first_question
    self.current_question = test.questions.order(:id).first if test.present?
  end

  def correct_answer?(answer_ids)
    answer_ids ||= []
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end
end
