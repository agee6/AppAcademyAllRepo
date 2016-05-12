class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
<<<<<<< HEAD
  include ApplicationHelper
  protect_from_forgery with: :exception

  def login!(user)
    user.reset_session_token!
    @current_user = user
    session[:session_token] = @current_user.session_token
  end

  def logout!
    current_user.reset_session_token!
    session[:session_token] = nil
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
=======
  # protect_from_forgery with: :exception
>>>>>>> df507360b6b87b8b4b69fe0523f2dca32d06e03e

end
