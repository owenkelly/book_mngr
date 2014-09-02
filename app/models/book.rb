class Book < ActiveRecord::Base

	validates :title, presence: true, uniqueness: true
	validates :author, presence: true
	validates :cover, presence: true
	validates :isbn, uniqueness: true, numericality: true,
			  length: { is: 13 }, allow_blank: true

	mount_uploader :cover, ImageUploader
	
	belongs_to :user
	
	has_many :reviews

	has_many :taggings
	has_many :tags, through: :taggings

	has_many :followings
	has_many :followers, through: :followings

	scope :active?, -> { where active: true }
	scope :deactive?, -> { where.not active: true}
	scope :has_reviews?, -> { where.not rating: nil}

	def self.ransackable_attributes auth_object = nil
		%w(title author) + _ransackers.keys
	end


	def average_rating
		self.reviews.average(:rating)
	end

	def tag_list
	  	tags.map(&:name).join(", ")
	end

	def tag_list=(names)
	  	self.tags = names.split(",").map do |n|
	    	Tag.where(name: n.strip).first_or_create!
		end
	end

	def follower_list
		followers.map(&:email).join(", ")
	end








	private

	ransacker :isbn do
  		Arel.sql(
    	"regexp_replace(to_char(\"#{table_name}\".\"isbn\", '9999999'), ' ', '', 'g')"
  		)
  	end	

  	ransacker :rating do
  		Arel.sql(
    	"regexp_replace(to_char(\"#{table_name}\".\"rating\", '9999999'), ' ', '', 'g')"
  		)
  	end	


	
end
