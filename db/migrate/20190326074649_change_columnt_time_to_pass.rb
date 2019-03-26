class ChangeColumntTimeToPass < ActiveRecord::Migration[5.2]
  def change
    remove_column :tests, :time_to_pass
    add_column :tests, :time_to_pass, :integer
  end
end
