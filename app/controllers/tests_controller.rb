class TestsController < ApplicationController
  before_action :set_test, only: [:start]
  before_action :set_user

  def index
    @tests = Test.all
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

private
  def set_test
    @test = Test.find(params[:id])
  end

  def set_user
    @user = User.first
  end
end