class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_app_user
  def current_app_user
    if current_user
      current_user.extend(Auth::AuthenticatedUser)
    else
      Auth::Visitor.new
    end
  end
end
