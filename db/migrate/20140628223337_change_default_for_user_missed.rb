class ChangeDefaultForUserMissed < ActiveRecord::Migration
  def change
    change_column :users, :missed, :integer, :default => 0
  end
end
