module TestPassageHelper
  def resolve_css_class(test_passage)
    test_passage.success? ? 'success' : 'failed'
  end

  def result_view(test_passage)
    result = test_passage.calculate_result
    if test_passage.success?
      "Congratulations, you've successfully passed the test. Your score is: #{result.round}%"
    else
      "You failed. Your score is: #{result.round}%"
    end
  end

  def current_question_view(test_passage)
    current_position = test_passage.current_question_position
    "#{current_position} question of #{test_passage.test.questions.count}"
  end
end
