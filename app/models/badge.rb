class Badge < ApplicationRecord
  has_many :user_badges, dependent: :nullify
  has_many :users, through: :users_badges
  belongs_to :category, optional: true

  validates :category, :level, presence: { unless: :category_or_level_present? }
  validates :category, uniqueness: { scope: %i[level test_passages_amount] }
  validates :name, :image_ref, presence: true

  private

  def category_or_level_present?
    self.level.present? || self.category.present?
  end
end
