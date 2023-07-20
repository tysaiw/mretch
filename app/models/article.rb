class Article < ApplicationRecord
    validates :title, :content, presence: true
    
    default_scope { where(deleted_at: nil) }
    
    belongs_to :user

    def destroy
        update(deleted_at: Time.current)
    end
end
