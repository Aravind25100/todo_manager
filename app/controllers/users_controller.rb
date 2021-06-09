class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
    render "users/new"
  end

  def index
    render plain: User.all.map { |user| user.to_pleasent_string }.join("\n")
  end

  def create
    User.create!(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
    )
    redirect_to root_path
  end

  def login
    email = params[:email]
    password = params[:password]
    user_email = User.find_by(email: email)
    user_password = user_email != nil ? user_email.password : nil
    response_text = user_password == password
    render plain: response_text
  end
end
