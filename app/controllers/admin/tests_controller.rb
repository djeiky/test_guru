class Admin::TestsController < Admin::BaseController
  before_action :set_tests, only: [:index, :update_inline]
  before_action :set_test, only: [:show, :destroy, :update, :edit, :update_inline]
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

  def edit

  end

  def update
    if @test.update(test_params)
      redirect_to [:admin, @test]
    else
      render :edit
    end
  end

  def update_inline
    if @test.update(test_params)
      redirect_to admin_tests_path
    else
      render :index
    end

  end

private
  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end

  def set_test
    @test = Test.find(params[:id])
  end

  def set_tests
    @tests = Test.all
  end

  def set_categories
    @categories = Category.all
  end
end
