module ApplicationHelper


	def render_stars object
		render "shared/average_stars.html.erb", object: object
	end
end
