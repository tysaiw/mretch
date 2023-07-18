class User < ApplicationRecord
    validates :password, confirmation: true

    validates :email, presence: true, 
    uniqueness: true, 
    format: { 
      with: URI::MailTo::EMAIL_REGEXP, 
      message: '格式有誤' 
    }
    
    def self.login(email, password)
        return nil if email.empty? or password.empty?
        #early return
        password = "x#{password}y".reverse
        password = Digest::SHA1.hexdigest(password)
        find_by email:, password:
    end

    before_create :encrypt_passwoard
    
    private
    def encrypt_passwoard
        pw = "x#{self.password}y".reverse
      self.password = Digest::SHA1.hexdigest(pw)
    end
end


