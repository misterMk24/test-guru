module QuestionHelper
  def question_header(question)
    test_title = question.test.title
    question.new_record? ? t('.create_question_header', title: test_title) : t('.edit_question_header', title: test_title)
  end
end
