class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
 devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable

        has_many :books
        has_many :favorites, dependent: :destroy

        has_many :follows, foreign_key: :follower_id
        has_many :followings, through: :follows

        has_many :inverse_follows, foreign_key: :following_id, class_name: Follow
        has_many :followers, through: :inverse_follows

def followed_by?(user)
    inverse_follows.where(follower_id: user.id).exists?
end

end
