module TestPassageHelper
  SUCCESS_TEST = 85
  TO_PERCENTAGE = 100

  def current_question_position(test_passage)
    question_ids = test_passage.test.questions.order(:id).pluck(:id)
    total_questions = question_ids.count
    current_position = question_ids.index(test_passage.current_question.id) + 1
    "#{current_position} question of #{total_questions}"
  end

  def success?(test_passage)
    calculate_result(test_passage) >= SUCCESS_TEST
  end

  def resolve_css_class(test_passage)
    success?(test_passage) ? "success" : "failed"
  end

  def result_view(test_passage)
    result = calculate_result(test_passage)
    if result >= SUCCESS_TEST
      "Congratulations, you've successfully passed the test. Your score is: #{result.round}%"
    else
      "You failed. Your score is: #{result.round}%"
    end
  end

  def calculate_result(test_passage)
    total_questions = test_passage.test.questions.count.to_f
    correct_questions = test_passage.correct_questions.to_f
    result = correct_questions / total_questions * TO_PERCENTAGE
  end
end
