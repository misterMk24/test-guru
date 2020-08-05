class Test < ApplicationRecord
  has_many :questions
  belongs_to :category
  has_and_belongs_to_many :users

  def self.ordered_tests(category)
    self.joins(:category).where(categories: { title: category })
  end
end
