class Book < ActiveRecord::Base

	validates :title, presence: true, uniqueness: true
	validates :author, presence: true
	validates :cover, presence: true

	mount_uploader :cover, ImageUploader
	
	has_many :reviews

	scope :active?, -> { where active: true }
	scope :deactive?, -> { where.not active: true}
	scope :has_reviews?, -> { where.not rating: nil}


	def self.ransackable_attributes auth_object = nil
		%w(title author isbn rating) + _ransackers.keys
	end


	def average_rating
		reviews.average(:rating)
	end

	
end
