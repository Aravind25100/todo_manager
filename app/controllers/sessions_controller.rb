class SessionsController < ApplicationController
  def new
    render "new"
  end

  def create
    user = User.find_by(email: params[:email])
    if (user && user.authenticate(params[:password]))
      render plain: "Correct password!"
    else
      render plain: "Incorrect password!"
    end
  end
end
