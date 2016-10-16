class User < ActiveRecord::Base
    validates :username, presence: true, 
                        uniqueness: { case_sensitive: false }, 
                        length: { mininum: 5, maximum: 20 }
    
    VALID_EMAIL_REGEX= /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true,
                        uniqueness: { case_sensitive: false },
                        format: { with: VALID_EMAIL_REGEX } #checks validity of email format
end
