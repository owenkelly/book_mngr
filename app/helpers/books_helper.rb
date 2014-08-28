module BooksHelper


	def disable_or_destroy book
		if book.reviews.count > 0
			link_to "Disable Book", book_disable_path(book), data: { confirm: 'Are you sure?' }
		else
			link_to 'Delete Book', book, method: :delete, data: { confirm: 'Are you sure?' }
		end
	end


	def tag_links book
		raw book.tags.map(&:name).map {|tag| link_to tag, tag_path(tag)}.join(", ")
	end


	def render_stars object
		render "shared/average_stars.html.erb", object: object
	end
end
