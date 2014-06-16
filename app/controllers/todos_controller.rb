class TodosController < ApplicationController

  def index
    @todos = current_user.todos
  end

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
      redirect_to todos_path
    else
      flash[:error] = "You entered an empty ToDo item. Please try again."
      render :new
    end
  end

  # Will delete todo item in the user's bitlist
  def destroy
    @todo = current_user.todos.find(params[:id])

    if @todo.destroy
      flash[:notice] = "Your todo was item deleted!"
      redirect_to todos_path
    else
      flash[:error] = "Could not delete item. Please try again."
      render :index
    end
  end


  private

  def todo_params
    params.require(:todo).permit(:description)
  end


end