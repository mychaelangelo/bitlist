class TodosController < ApplicationController

  def show
    @todo = Todo.find(params[:id])
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = current_user.todos.build(todo_params)

    if @todo.save
      flash[:notice] = "Your Todo item saved."
      redirect_to @todo
    else
      flash[:error] = "You entered an empty ToDo item. Please try again."
      render :new
    end
  end

  private

  def todo_params
    params.require(:todo).permit(:description)
  end


end