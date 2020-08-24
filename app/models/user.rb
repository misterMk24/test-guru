class User < ApplicationRecord
  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :tests, inverse_of: 'author', foreign_key: 'author_id'

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true

  def tests_by_level(level)
    self.tests.where(level: level.to_i)
  end
end
