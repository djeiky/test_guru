class BadgesController < ApplicationController
  def index
    @badges = Badge.all
  end

  def user_badges
    @user_badges = current_user.user_badges
  end
end
