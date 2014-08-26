class Book < ActiveRecord::Base

	validates :title, presence: true, uniqueness: true
	validates :author, presence: true
	validates :cover, presence: true

	mount_uploader :cover, ImageUploader
	
	has_many :reviews
	has_many :taggings
	has_many :tags, through: :taggings

	scope :active?, -> { where active: true }
	scope :deactive?, -> { where.not active: true}
	scope :has_reviews?, -> { where.not rating: nil}

	def self.ransackable_attributes auth_object = nil
		%w(title author) + _ransackers.keys
	end


	def average_rating
		reviews.average(:rating)
	end

	def self.tagged_with(name)
	  	Tag.find_by_name!(name).articles
	end

	def self.tag_counts
	  	Tag.select("tags.*, count(taggings.tag_id) as count").
	    joins(:taggings).group("taggings.tag_id")
	end

	def tag_list
	  	tags.map(&:name).join(", ")
	end

	def tag_list=(names)
	  	self.tags = names.split(",").map do |n|
	    	Tag.where(name: n.strip).first_or_create!
		end
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
