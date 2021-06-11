class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def new
    render "users/new"
  end

  def create
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
      else
        flash[:error] = user.errors.full_messages.join(", ")
        redirect_to new_user_path
      end
    end
  end
end
