module QuestionHelper
  def question_header(test, question)
    question.new_record? ? "Create New #{test.title} Question" : "Edit #{question.test.title} Question"
  end
end
