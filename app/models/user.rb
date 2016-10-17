class User < ActiveRecord::Base
    has_many :articles
    
    before_save { self.email = email.downcase }
    
    validates :username, presence: true, 
                        uniqueness: { case_sensitive: false }, 
                        length: { mininum: 5, maximum: 20 }

    VALID_EMAIL_REGEX= /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true,
                        uniqueness: { case_sensitive: false },
                        length: { maximum: 105 },
                        format: { with: VALID_EMAIL_REGEX } #checks validity of email format using REGEX
   
    has_secure_password
end