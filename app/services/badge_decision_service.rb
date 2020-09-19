class BadgeDecisionService
  def initialize(test_passage)
    @test_passage = test_passage
    @test = @test_passage.test
    @category = @test.category
    @user = @test_passage.user
    @badges = Badge.all
  end

  def decide
    @badges.each do |badge|
      UserBadge.create(user: @user, badge: badge) if converges?(badge)
    end
  end

  private

  def converges?(badge)
    if is_category?(badge) && is_level?(badge)
      is_passages_amount?(badge) || is_first_attempt?(badge)
    else
      return false
    end
  end

  def is_first_attempt?(badge)
    (@user.tests.where(id: @test.id).count == 1) && badge.first_attempt
  end

  def is_category?(badge)
    badge_cat = badge.category
    badge_cat == @test.category || badge_cat.nil?
  end

  def is_level?(badge)
    badge_lvl = badge.level
    badge_lvl == @test.level || badge_lvl.nil?
  end

  def is_passages_amount?(badge)
    user_tests = @user.test_passages.where(test: @test)
    if badge.test_passages_amount.zero?
      # means that all tests by mentioned criteria should be passed successfully
      user_tests.count == user_tests.where(success: true) 
    else
      badge.test_passages_amount == user_tests.where(success: true).count
    end
  end
end
