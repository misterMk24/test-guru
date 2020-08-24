class Question < ApplicationRecord
  belongs_to :test
  has_many :answers
  has_many :test_passages, inverse_of: 'current_question', foreign_key: 'current_question_id'

  validates :body, presence: true
end
