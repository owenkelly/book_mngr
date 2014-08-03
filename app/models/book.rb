class Book < ActiveRecord::Base

	validates :title, presence: true, uniqueness: true
	validates :rating, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }

	scope :active?, -> { where active: true }
	scope :deactive?, -> { where.not active: true}
end
