class GistsController < ApplicationController
  def create
    @test_passage = TestPassage.find(params[:test_passage_id])
    @question = @test_passage.current_question
    result = GistQuestionService.new(@question).call
    gist = Gist.new(
      user: current_user, 
      question: @question,
      gist_url: result.html_url,
      gist_hash: result.hash
    )
    
    flash_options = if result.instance_of?(Sawyer::Resource) && gist.save
      { notice: t('.success', gist_url: gist.gist_url) }
    else
      { alert: t('.failure') }
    end

    redirect_to @test_passage, flash_options
  end
end
