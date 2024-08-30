class User < ApplicationRecord
# Include default devise modules. Others available are:
# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
 devise :database_authenticatable, :registerable,
       :recoverable, :rememberable, :validatable
       has_many :hearts, dependent: :destroy
       has_many :likes, dependent: :destroy
       has_many :liked_hearts, through: :likes, source: :heart
       def already_liked?(heart)
              self.likes.exists?(heart_id: heart.id)
       end
end

