class QuestionsController < ApplicationController
  before_action :set_test, only: [:index, :new, :create]
  before_action :set_question, only: [:show, :destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :resque_with_question_not_found

  def index
  end

  def show
  end

  def new
    @question = Question.new
  end

  def create
    question = @test.questions.new(question_params)
    if question.save
      redirect_to test_questions_path(@test)
    else
      render html: "error saving question"
    end
  end

  def destroy
    @question.destroy
    render html: "Question deleted"
  end

private
  def set_question
    @question = Question.find(params[:id])
  end

  def set_test
    @test = Test.find(params[:test_id])
  end

  def resque_with_question_not_found
    render html: "Question not found"
  end

  def question_params
    params.require(:question).permit(:body, :test_id)
  end
end
