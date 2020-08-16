class Test < ApplicationRecord
  has_many :questions
  belongs_to :author, class_name: "User", foreign_key: 'author_id'
  belongs_to :category
  has_many :test_passages
  has_many :users, through: :test_passages

  validates :title, presence: true
  validates :title, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true,
                      greater_than_or_equal_to: 0 }

  scope :simple, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where('level >= 5') }

  scope :tests_by_category, ->(category) { joins(:category).where(categories: { title: category }) }

  def self.ordered_tests(category)
    tests_by_category(category).order(id: :desc).pluck(:title)
  end
end
