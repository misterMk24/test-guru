class TestsController < ApplicationController
  before_action :current_test_get, only: [:show, :edit, :update, :destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :rescue_with_parameters_invalid

  def index
    @tests = Test.all
    render plain: "There are no tests for this test" if @tests.empty?
  end

  def show
    @questions = @test.questions
  end

  def new
    @test = Test.new
  end

  def edit
  end

  def update
    if @test.update(test_params)
      redirect_to @test
    else
      render :edit
    end
  end

  def create
    @test = Test.new(test_params)

    if @test.save!
      redirect_to @test
    else
      redirect_to action: 'new'
    end
  end

  def destroy
    @test.destroy
    redirect_to tests_path
  end

  private

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :author_id)
  end

  def current_test_get
    @test = Test.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render plain: "There is no such test"
  end

  def rescue_with_test_not_found
    render plain: 'Test was not found'
  end

  def rescue_with_parameters_invalid
    render partial: 'shared/errors', locals: { resource: @test }
  end
end
