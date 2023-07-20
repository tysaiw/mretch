module UsersHelper
  def user_signed_in?
    session[:kitty].present?
  end

  def current_user
    if user_signed_in?
      
      @__user ||= User.find_by(id: session[:kitty])

    else
      il
    end
  end

end
