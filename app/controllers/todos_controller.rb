class TodosController < ApplicationController

  def index
    @todos = current_user.todos
    @todo = Todo.new
    @todo.due = Time.now
  end

  def show
    @todo = Todo.find(params[:id])
  end

  def new
    @todo = Todo.new 
  end

  def create
    if current_user.todos.count >= 5
      flash[:alert] = "You have too many items. Please remove one then try again."
      redirect_to todos_path
    else
      @todo = current_user.todos.build(todo_params)
      @todo.due = Time.now + (@todo.duedays.days)

      if @todo.save
        flash[:notice] = "Your Todo item saved."
        redirect_to todos_path
      else
        flash[:error] = "You entered an empty ToDo item. Please try again."
        redirect_to todos_path
      end
    end
  end 


  def update
    @todo = current_user.todos.find(params[:id])

    if @todo.update_attributes(todo_params)
      flash[:notice] = "Todo was updated."
      redirect_to todos_path
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :show
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
      redirect_to todos_path
    end
  end

  # delete item and give incrememet completed items by 1
  def done
    @todo =current_user.todos.find(params[:id])

    if @todo.destroy
      # update completed/missed items number for user and save changes to dB
      if @todo.expired?
        current_user.missed += 1
      else
        current_user.completed += 1
      end
      current_user.save

      flash[:notice] = "Yay! Your item was completed!"
      redirect_to todos_path
    else
      flash[:error] = "Could not clear item. Please try again."
      redirect_to todos_path
    end
  end


  private

  def todo_params
    params.require(:todo).permit(:description, :duedays)
  end


end