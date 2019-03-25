class AddPassedToTestPassages < ActiveRecord::Migration[5.2]
  def change
    add_column :test_passages, :passed, :boolean, null: false,  default: false
  end
end
