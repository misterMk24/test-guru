class BadgeDecisionService
  def initialize(test_passage)
    @test_passage = test_passage
    @test = @test_passage.test
    @category = @test.category
    @level = @test.level
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
    if is_category?(badge) && is_level?(badge) && is_first_attempt?(badge)
      is_passages_amount?(badge)
    else
      return false
    end
  end

  def is_first_attempt?(badge)
    user_first_attempt = @user.tests.where(id: @test.id).count == 1
    user_first_attempt == badge.first_attempt || user_first_attempt
  end

  def is_category?(badge)
    case badge.category
    when @category then return true
    when nil
      @user_tests ||= @user.tests.where(level: @level).distinct
      @tests ||= Test.where(level: @level)
      return true
    
    else return false
    end
  end

  def is_level?(badge)
    case badge.level
    when @level then return true
    when nil
      @user_tests ||= @user.tests.where(category: @category).distinct
      @tests ||= Test.where(category: @category)
      return true

    else return false
    end
  end

  def is_passages_amount?(badge)
    return true if badge.test_passages_amount == 1

    @user_tests ||= @user.tests.where(level: @level, category: @category).distinct
    @tests ||= Test.where(category: @category, level: @level)
    count = @user.test_passages.select('distinct on (test_id) *').where(test: @user_tests, success: true).length
    badge.test_passages_amount.zero? ? @tests.count == count : badge.test_passages_amount == count
  end
end
