class ApplicationController < ActionController::Base
    rescue_from ActiveRecord::RecordNotFound, with: :not_found #rails送的,類似比對找到這過方法
    
    private
    def not_found
        render file: Rails.root.join("public", "404.html"), 
                   status: 404, #對瀏覽器說明
                   layout: false
    end
end
