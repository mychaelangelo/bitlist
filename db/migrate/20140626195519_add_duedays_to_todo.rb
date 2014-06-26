class AddDuedaysToTodo < ActiveRecord::Migration
  def change
    add_column :todos, :duedays, :int
  end
end
