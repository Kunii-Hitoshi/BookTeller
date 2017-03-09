class Favorite < ApplicationRecord
	belongs_to :user
    belongs_to :book

    validates :user, presence: true
    validates :user_id, uniqueness: { scope: :book_id }
    validates :book, presence: true
end
