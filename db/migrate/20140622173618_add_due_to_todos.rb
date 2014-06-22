class AddDueToTodos < ActiveRecord::Migration
  def change
    add_column :todos, :due, :datetime
  end
end
