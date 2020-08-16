class Question < ApplicationRecord
  belongs_to :test
  has_many :answers
  has_many :test_passages, inverse_of: 'current_question'

  validates :body, presence: true
end
