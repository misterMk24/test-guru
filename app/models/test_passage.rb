class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', foreign_key: 'current_question_id', optional: true

  before_validation :before_validation_set_first_question, on: :create
  before_validation :before_validation_change_current_question, on: :update

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end
    self.save
  end

  def completed?
    current_question.nil?
  end

  def success?
    calculate_result >= SUCCESS_TEST
  end

  def calculate_result
    total_questions = self.test.questions.count.to_f
    correct_questions = self.correct_questions.to_f
    result = correct_questions / total_questions * TO_PERCENTAGE
  end

  def current_question_position
    question_ids = self.test.questions.order(:id).pluck(:id)
    current_position = question_ids.index(self.current_question.id) + 1
  end

  private

  SUCCESS_TEST = 85
  TO_PERCENTAGE = 100

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def before_validation_change_current_question
    self.current_question = next_question
  end

  def correct_answer?(answer_ids)
    return false if answer_ids.nil?

    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    self.test.questions.order(:id).where('id > ?', current_question.id).first
  end
end
