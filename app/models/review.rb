class Review < ActiveRecord::Base
	validates :user_id, uniqueness: { :scope => :book_id,
    message: "Users may only write one review per book." }

	belongs_to :book
	belongs_to :user

	validates :rating, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }

	def self.ransackable_attributes(auth_object = nil)
		%w(review_text) + _ransackers.keys
	end



	private

	ransacker :rating do
  		Arel.sql(
    	"regexp_replace(to_char(\"#{table_name}\".\"rating\", '9999999'), ' ', '', 'g')"
  		)
  	end	

end
