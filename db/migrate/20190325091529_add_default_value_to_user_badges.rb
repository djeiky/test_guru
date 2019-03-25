class AddDefaultValueToUserBadges < ActiveRecord::Migration[5.2]
  def change
    change_column_default :user_badges, :badges_count, 1
  end
end
