class User < ApplicationRecord
  has_and_belongs_to_many :tests

  def tests_by_level(level)
    self.tests.where(level: level.to_i)
  end
end
