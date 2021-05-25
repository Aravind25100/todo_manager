Rails.application.routes.draw do

  # RESOURCES

  # Todo is a resource
  # - list of recources can be seen: index
  # - single recource can be seen: show
  # create a new todo

  get "todos", to: "todos#index"
  get "todos/create", to: "todos#create"
  get "todos/:id", to: "todos#show"
end
