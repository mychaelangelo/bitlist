class AddMissedToUsers < ActiveRecord::Migration
  def change
    add_column :users, :missed, :integer
  end
end
