class Review < ActiveRecord::Base

	belongs_to :book

	validates :rating, presence: true, numericality: { less_than_or_equal_to: 5 }

	def self.ransackable_attributes(auth_object = nil)
		%w(review) + _ransackers.keys
	end



	private

	ransacker :rating do
  		Arel.sql(
    	"regexp_replace(to_char(\"#{table_name}\".\"rating\", '9999999'), ' ', '', 'g')"
  		)
  	end	

end
