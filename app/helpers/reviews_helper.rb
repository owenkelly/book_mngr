module ReviewsHelper

	def render_rating_stars review
		if review.rating
			render 'rating_stars.html.erb', score: review.rating
		else
			render 'rating_stars.html.erb', score: 0
		end
	end

end
