class ApplicationController < ActionController::Base
    rescue_from ActiveRecord::RecordNotFound, with: :not_found #rails送的,類似比對找到這過方法
    
    helper_method :user_signed_in?, :current_user
    
    private

    def user_signed_in?
        session[:kitty].present?
    end
    
    def current_user
        if user_signed_in?
        @__user ||= User.find_by(id: session[:kitty])
    
        else
        nil
        end
    end
    

    def authenticate_user!
        if not user_signed_in?
            redirect_to login_users_path, alert:"please login in!"
        end
    end

    def not_found
        render file: Rails.root.join("public", "404.html"), 
                status: 404, #對瀏覽器說明
                layout: false
    end
end
