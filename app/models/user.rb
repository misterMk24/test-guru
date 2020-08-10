class User < ApplicationRecord
  has_and_belongs_to_many :tests
  has_many :tests, inverse_of: 'author'

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true

  def tests_by_level(level)
    self.tests.where(level: level.to_i)
  end
end
