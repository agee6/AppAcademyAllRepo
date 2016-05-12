module ApplicationHelper
<<<<<<< HEAD

  def current_user
    return nil if session[:session_token].nil?
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def auth_token
    token = <<-HTML
      <input
        type="hidden"
        name="authenticity_token"
        value="#{form_authenticity_token}">
    HTML
    token.html_safe
  end

=======
>>>>>>> df507360b6b87b8b4b69fe0523f2dca32d06e03e
end
