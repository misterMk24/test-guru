class QuestionsController < ApplicationController
  before_action :get_current_test
  before_action :get_questions_list
  before_action :get_current_question, except: [:create, :new, :index]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
  end

  def show
  end

  def new
    @question = Question.new
  end

  def create
    @current_question = Question.new(body: params[:body], test_id: params[:test_id])

    if @current_question.save
      redirect_to action: 'show', id: @current_question.id
    else
      redirect_to action: 'new'
    end
  end

  def destroy
    Question.find(params[:id]).destroy
    render plain: 'Question was successfully deleted'
  end

  private

  def question_params
    params.require(:question).permit(:body, :test_id)
  end

  def get_current_test
    @current_test = Test.find(params[:test_id])
  rescue ActiveRecord::RecordNotFound
    render plain: "There is no such test"
  end

  def get_questions_list
    @questions = Question.where(test_id: params[:test_id])
    render plain: "There are no questions for this test" if @questions.empty?
  end

  def get_current_question
    @current_question = @questions.find(params[:id])
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found'
  end
end
