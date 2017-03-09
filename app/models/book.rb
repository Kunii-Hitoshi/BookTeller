class Book < ApplicationRecord
	belongs_to :user
	mount_uploader :image, ImageUploader

	acts_as_ordered_taggable_on :interests
	has_many :favorites, dependent: :destroy

	def favorited_by? user
    favorites.where(user_id: user.id).exists?
end
end
