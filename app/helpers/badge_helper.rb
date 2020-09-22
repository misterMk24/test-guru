module BadgeHelper
  def images_list
    ['icon_1', 'icon_2', 'icon_3', 'icon_4']
  end

  def level_view(badge)
    badge.level.nil? ? t('.level_nil') : badge.level
  end

  def category_view(badge)
    badge.category.nil? ? t('.category_nil') : badge.category.title
  end

  def first_attempt_view(badge)
    @badge.first_attempt ? t('.attempt_true') : t('.attempt_false')
  end
end
