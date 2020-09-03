module TestPassageHelper
  def result_view(test_passage)
    result = test_passage.calculate_result
    if test_passage.success?
      "<p class= success>Congratulations, you've successfully passed the test. Your score is: #{result.round}%</p>".html_safe
    else
      "<p class= failed>You've failed. Your score is: #{result.round}%</p>".html_safe
    end
  end

  def current_question_view(test_passage)
    current_position = test_passage.current_question_position
    "#{current_position} question of #{test_passage.test.questions.count}"
  end
end
