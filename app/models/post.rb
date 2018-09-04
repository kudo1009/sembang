class Post < ApplicationRecord
    validates :content, {presence: true, length: {maximum:140}}
    validates :user_id, {presence: true}
    has_many :favorites, dependent: :destroy
    has_many :favorite_users, through: :favorites, source: :user
    belongs_to :user
    
end
