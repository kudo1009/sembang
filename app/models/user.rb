class User < ApplicationRecord
    
    validates :name, presence: true, length: { maximum: 30 }
    validates :email, presence: true, length: { maximum: 255 }
    before_validation { email.downcase! }
    validates :password, presence: true, length: { minimum: 6 }
    has_secure_password
    
end
