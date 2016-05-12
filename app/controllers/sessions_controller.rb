class SessionsController < ApplicationController

  def create #user is logging in
    user = User.find_by_credentials(user_params[:email],
      user_params[:password])

    if user
      login!(user)
      redirect_to user_url(user) # /users/:id
    else
      redirect_to new_session_url # /login
    end
  end

  def destroy
    logout!
    redirect_to new_session_url
  end


end
