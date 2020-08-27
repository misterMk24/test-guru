class QuestionsController < ApplicationController
  before_action :current_test, only: %i[create index new]
  before_action :current_question, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = @test.questions
    render plain: "There are no questions for this test" if @questions.empty?
  end

  def show
  end

  def new
    @question = @test.questions.new
  end

  def edit
  end

  def update
    if @question.update(question_params)
      redirect_to @question
    else
      render :edit
    end
  end

  def create
    @question = @test.questions.new(question_params)

    if @question.save
      redirect_to @question
    else
      redirect_to action: 'new'
    end
  end

  def destroy
    @question.destroy
    redirect_to action: 'index', test_id: @question.test_id
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def current_test
    @test = Test.find(params[:test_id])
  rescue ActiveRecord::RecordNotFound
    render plain: "There is no such test"
  end

  def current_question
    @question = Question.find(params[:id])
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found'
  end
end
