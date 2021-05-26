class TodosController < ApplicationController
  #Skip verfying the authenticity token
  skip_before_action :verify_authenticity_token

  def index
    render plain: Todo.all.order(:due_date).map { |todo| todo.to_pleasent_string }.join("\n")
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
    id = params[:id]
    todo = Todo.find_by(id: id)
    if (todo != nil)
      todo_text, completed, due_date = params[:todo_text], params[:completed], params[:due_date]

      todo_text != nil ? todo.todo_text = todo_text : nil
      due_date != nil ? todo.due_date = due_date : nil
      completed != nil ? todo.completed = completed : nil
      todo.save!

      render plain: "Update todo completed status to #{completed}"
    else
      render plain: "Error! invalid id #{id}"
    end
  end
end
