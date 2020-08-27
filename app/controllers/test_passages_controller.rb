class TestPassagesController < ApplicationController
  before_action :current_test_passage, only: %i[show result update]

  def show
    unless @test_passage.user.id == current_user.id
      redirect_to tests_path, notice: "You do not have permission"
    end
  end

  def result
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

  def current_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
