class TodosController < ApplicationController
  #Skip verfying the authenticity token
  skip_before_action :verify_authenticity_token

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

    if todo.update(completed: params[:completed])
      render plain: "Updated todo"
    else
      render plain: "Failed to update todo: #{todo.errors.full_messages.join(", ")}"
    end
  end
end
