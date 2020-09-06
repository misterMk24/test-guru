module GistHelper
  def question_link(gist)
    link_to gist.question.body.slice(0...25)..., admin_question_path(gist.question)
  end
end
