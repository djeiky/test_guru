class QuestionsController < ApplicationController
  before_action :set_test, only: [:index]
  before_action :set_question, only: [:show]

  def show
  end

private
  def set_question
    @question = Question.find(params[:id])
  end

  def set_test
    @test = Test.find(params[:test_id])
  end
end
