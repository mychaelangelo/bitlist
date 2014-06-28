class ChangeDefaultForUserCompleted < ActiveRecord::Migration
  def change
    change_column :users, :completed, :integer, :default => 0
  end
end
