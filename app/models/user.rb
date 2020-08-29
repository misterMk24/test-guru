class User < ApplicationRecord

  devise :database_authenticatable, 
         :registerable,
         :recoverable, 
         :rememberable, 
         :validatable,
         :confirmable
  
  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :authored_tests, class_name: 'Test', foreign_key: 'author_id'
  
  validates :username, presence: true, 
                       uniqueness: true
  validates :email, presence: true, uniqueness: true,
                    length: { maximum: 50 }, format: { with: URI::MailTo::EMAIL_REGEXP }

  # has_secure_password

  def tests_by_level(level)
    self.tests.where(level: level.to_i)
  end

  def test_passage(test)
    self.test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
