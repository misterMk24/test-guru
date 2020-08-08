class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validates_each :question_id do |record, attr, value|
    if Question.find(value).answers.count == MAX_QUESTION_AMOUNT
     record.errors.add attr, "shouldn't has more than 4 answers"
    end
  end

  scope :correct, -> { where(correct: true) }

  private

  MAX_QUESTION_AMOUNT = 4
end
