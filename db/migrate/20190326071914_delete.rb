class Delete < ActiveRecord::Migration[5.2]
  def change
    change_column_default :tests, :time_to_pass, nil
  end
end
