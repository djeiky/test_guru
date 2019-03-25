class AddLevelToBadges < ActiveRecord::Migration[5.2]
  def change
    add_column :badges, :level, :integer, null: false, default: 1
  end
end
