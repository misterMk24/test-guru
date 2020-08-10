class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :validate_question_capacity, on: :create

  scope :correct, -> { where(correct: true) }

  private

  def validate_question_capacity
    if question.answers.count == MAX_QUESTION_AMOUNT
      errors.add(:base, 'This question has four answers already')
    end
  end

  MAX_QUESTION_AMOUNT = 4
end
