Rails.application.routes.draw do

  # RESOURCES

  # Todo is a resource
  # - list of recources can be seen: index
  # - single recource can be seen: show
  # create a new resource

  get "todos", to: "todos#index"
  get "todos/:id", to: "todos#show"
end
