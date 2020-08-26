class User < ApplicationRecord
  
  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :authored_tests, class_name: 'Test', foreign_key: 'author_id'
  validates :username, presence: true 
  validates :username, uniqueness: true
  validates :email, presence: true 
  validates :email, uniqueness: true
  validates :email, length: { maximum: 50 }
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }

  has_secure_password

  def tests_by_level(level)
    self.tests.where(level: level.to_i)
  end

  def test_passage(test)
    self.test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
