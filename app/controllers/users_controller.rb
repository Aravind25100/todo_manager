class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def new
    render "users/new"
  end

  def create
<<<<<<< HEAD
    first_name, last_name, email, password = params[:first_name], params[:last_name], params[:email], params[:password]
    if (first_name != nil && last_name != nil && password != nil && email != nil)
      response_text = ""
      if !User.find_by(email: email)
        new_user = User.create!(first_name: first_name, last_name: last_name, email: email, password_digest: password)
        response_text = "User succesfully created with the id #{new_user.id}"
=======
    if User.find_by(email: params[:email])
      flash[:error] = "Email Id already taken!"
      redirect_to new_user_path
    else
      user = User.new(
        first_name: params[:first_name],
        last_name: params[:last_name],
        email: params[:email],
        password: params[:password],
      )

      if user.save
        session[:current_user_id] = user.id
        redirect_to root_path
>>>>>>> level8
      else
        flash[:error] = user.errors.full_messages.join(", ")
        redirect_to new_user_path
      end
    end
  end
<<<<<<< HEAD

  def login
    email = params[:email]
    password = params[:password]
    user_email = User.find_by(email: email)
    user_password = user_email != nil ? user_email.password_digest : nil
    response_text = user_password == password
    render plain: response_text
  end
=======
>>>>>>> level8
end
