class TodosController < ApplicationController
  def index
    render "index"
  end

  def show
    id = params[:id]
    todo = Todo.find_by(id: id)
    render "todo"
  end

  def create
    todo_text = params[:todo_text]
    due_date = DateTime.parse(params[:due_date])
    new_todo = Todo.create!(
      todo_text: todo_text,
      due_date: due_date,
      completed: false,
    )
    redirect_to todos_path
  end

  def update
    todo = Todo.find_by(id: params[:id])
    if todo.blank?
      render plain: "Todo could not be found"
      return
    end

    completed = params[:completed] ? true : false
    if todo.update(completed: completed)
      redirect_to todos_path
    else
      render plain: "Failed to update todo: #{todo.errors.full_messages.join(", ")}"
    end
  end

  def destroy
    id = params[:id]
    todo = Todo.find(id)
    todo.destroy
    redirect_to todos_path
  end
end
