class Test < ApplicationRecord
  has_many :questions
  belongs_to :category
end
