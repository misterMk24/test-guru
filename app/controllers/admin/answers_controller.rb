class Admin::AnswersController < Admin::BaseController
  before_action :current_answer, only: %i[edit show update destroy]
  before_action :current_question, only: %i[create new]

  def show
  end

  def new
    @answer = @question.answers.new
  end

  def create
    @answer = @question.answers.new(answer_params)
    if @answer.save
      redirect_to [:admin, @answer]
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @answer.update(answer_params)
      redirect_to [:admin, @answer]
    else
      render :edit
    end
  end

  def destroy
    @answer.destroy
    redirect_to [:admin, @answer.question]
  end

  private

  def answer_params
    params.require(:answer).permit(:body, :correct)
  end

  def current_question
    @question = Question.find(params[:question_id])
  end

  def current_answer
    @answer = Answer.find(params[:id])
  end
end
