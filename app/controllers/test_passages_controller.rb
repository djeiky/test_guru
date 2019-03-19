class TestPassagesController < ApplicationController
  before_action :set_test_passage, only: [:show, :result, :update, :gist]

  def show
  end

  def result
  end

  def gist
    gist_resp = GistQuestionService.new(@test_passage.current_question).call

    gist_link = "https://gist.github.com/#{gist_resp.id}"

    gist = Gist.new(question: @test_passage.current_question,
                    user: current_user,
                    url: gist_link
                   )
    if gist.save
      notice = t(".success", link: "#{view_context.link_to('Gist', gist_link, target: "_blank")}")
      redirect_to test_passage_path(@test_passage), notice: notice
    else
      redirect_to test_passage_path(@test_passage), alert: t('.failed')
    end
  end

  def update
    @test_passage.accept!(params[:answer_ids])
    if @test_passage.completed?
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

private
  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
