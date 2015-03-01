module AuthHelper
  def for_authenticated_user(&block)
    if current_app_user.authenticated?
      block.call
    end
  end

  def for_non_authenticated_user(&block)
    unless current_app_user.authenticated?
      block.call
    end
  end
end
