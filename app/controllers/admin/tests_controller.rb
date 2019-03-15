class Admin::TestsController < Admin::BaseController
  before_action :set_test, only: [:show, :destroy, :update, :edit]
  before_action :set_categories
  def index
    @tests = Test.all
  end
  
  def new
    @test = Test.new
  end

  def create
    @test = Test.new(test_params)
    @test.author = current_user
    if @test.save
      redirect_to admin_test_path(@test)
    else
      render :new
    end
  end

private
  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end

  def set_test
    @test = Test.find(params[:id])
  end

  def set_categories
    @categories = Category.all
  end
end
