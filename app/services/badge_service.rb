class BadgeService
  def initialize(test_passage)
    @test_passage = test_passage
    @user = @test_passage.user
    @test = @test_passage.test
  end

  def gain_badges
    new_badges = Badge.all.map {|badge| send("#{badge.badge_type.name}_badge_check", badge)}.compact
    new_badges.each {|badge| add_badge(badge)}
    new_badges
  end

  def category_badge_check(badge)
    badge if all_category_passed?(@test.category)
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
      tests_count == @user.success_tests.where(level: level).uniq.count
  end

  def all_category_passed?(category)
    tests_count = Test.tests_by_category(category.title).count
    tests_count == 0 ? false :
      tests_count == @user.success_tests.where(category: category).uniq.count
  end

  def add_badge(badge)
    user_badge = @user.user_badges.find_by(badge_id: badge.id)
    if user_badge
      user_badge.badges_count += 1
      user_badge.save!
    else
      @user.user_badges.create!(badge_id: badge.id)
    end
  end
end
