class TestsController < ApplicationController
  before_action :current_test, only: :start
  
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    @tests = Test.all
    render plain: "There are no tests yet" if @tests.empty?
  end

  def start
    if @test.questions.empty?
      redirect_to root_path, notice: t('.questions_empty')
    else
      current_user.tests.push(@test)
      redirect_to current_user.test_passage(@test)
    end
  end

  private

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end

  def current_test
    @test = Test.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render plain: "There is no such test"
  end

  def rescue_with_test_not_found
    render plain: 'Test was not found'
  end
end
