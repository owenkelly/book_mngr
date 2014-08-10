class Book < ActiveRecord::Base

	validates :title, presence: true, uniqueness: true
	validates :author, presence: true
	validates :cover, presence: true

	mount_uploader :cover, ImageUploader
	
	has_many :reviews

	scope :active?, -> { where active: true }
	scope :deactive?, -> { where.not active: true}

	def self.ransackable_attributes auth_object = nil
		%w(title author isbn tags) + _ransackers.keys
	end
	
end
