class TodosController < ApplicationController
  #Skip verfying the authenticity token
  skip_before_action :verify_authenticity_token

  def index
    render plain: Todo.all.order(:due_date).map { |todo| todo.to_pleasent_string }.join("\n")
    # render "index"
  end

  def show
    id = params[:id]
    todo = Todo.find_by(id: id)
    todo != nil ? (render plain: todo.to_pleasent_string) : (render plain: "Error! Invalid todo_id #{id}")
  end

  def create
    todo_text = params[:todo_text]
    due_date = DateTime.parse(params[:due_date])
    new_todo = Todo.create!(
      todo_text: todo_text,
      due_date: due_date,
      completed: false,
    )
    response_text = "Your todo is created with the id #{new_todo.id}"
    render plain: response_text
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
