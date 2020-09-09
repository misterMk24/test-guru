class GistsController < ApplicationController
  def create
    @test_passage = TestPassage.find(params[:test_passage_id])
    @question = @test_passage.current_question
    gist_service = GistQuestionService.new(@question)
    result = gist_service.call
    gist = current_user.gists.new(
      question: @question,
      gist_url: result.html_url,
      gist_hash: result.hash
    )

    flash_options = if gist_service.success? && gist.save
      { notice: t('.success', gist_url: gist.gist_url) }
    else
      { alert: t('.failure') }
    end

    redirect_to @test_passage, flash_options
  end
end
