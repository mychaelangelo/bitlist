class TodosController < ApplicationController

  def show
    @todo = Todo.find(params[:id])
  end

  def new
  end

  def create
    @todo = Todo.new(todo_params)

    if @todo.save
      redirect_to @todo, notice: 'Your new TODO was saved'
    else
      redirect_to new_todo_path, notice: 'You entered an empty TODO item, please try again'
    end
  end

  private

  def todo_params
    params.require(:todo).permit(:description)
  end


end