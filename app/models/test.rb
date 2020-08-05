class Test < ApplicationRecord
  has_many :questions
  belongs_to :category
  has_and_belongs_to_many :users

  def self.ordered_tests(category)
    self.where(category_id: Category.find_by(title: category.downcase).id).order(id: :desc)
  end
end
