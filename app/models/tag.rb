class Tag < ActiveRecord::Base

	has_many :taggings
	has_many :books, through: :taggings

	def self.ransackable_attributes(auth_object = nil)
		["name"] + _ransackers.keys
	end

end
