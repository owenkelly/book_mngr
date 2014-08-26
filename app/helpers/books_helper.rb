module BooksHelper


	def disable_or_destroy book
		if book.rating > 0
			link_to "Disable", book_disable_path(book), data: { confirm: 'Are you sure?' }
		else
			link_to 'Destroy', book, method: :delete, data: { confirm: 'Are you sure?' }
		end
	end


	def tag_links book
		raw book.tags.map(&:name).map {|tag| link_to tag, tag_path(tag)}.join(", ")
	end


	def render_stars book
		render "shared/average_stars.html.erb", book: book
	end
end
