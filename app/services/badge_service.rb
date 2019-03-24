class BadgeService
  def initialize(test_passage)
    @test_passage = test_passage
    @user = @test_passage.user
    @test = @test_passage.test
  end

  def gain_badges
    Badge.all.map {|badge| send("#{badge.badge_type.name}_badge_check", badge)}.compact
  end

  def category_badge_check(badge)
    badge if all_category_passed?(@test)
  end

  def level_badge_check(badge)
    badge if all_level_passed?(badge.level)
  end

  def attempt_badge_check(badge)
    badge if first_attempt?(badge)
  end

private
  def first_attempt?(badge)
    @user.tests.where(id: @test.id).count == 1 && @test_passage.passed
  end

  def all_level_passed?(level)
    tests_count = Test.where(level: level).count
    tests_count == 0 ? false :
      tests_count == @user.completed_tests(level: level).uniq.count
  end

  def all_category_passed?(test)
    category = Category.find_by(id: test.category_id)
    tests_count = Test.where(category_id: category.id).count
    tests_count == 0 ? false :
      tests_count == @user.completed_tests(category: category).uniq.count

  end
end
