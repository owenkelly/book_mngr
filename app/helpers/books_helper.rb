module BooksHelper


	def disable_or_destroy book
		if book.reviews.count > 0
			link_to "Disable Book", disable_book_path(book), data: { confirm: 'Are you sure?' }
		else
			link_to 'Delete Book', book, method: :delete, data: { confirm: 'Are you sure?' }
		end
	end


	def tag_links book
		raw book.tags.map(&:name).map {|tag| link_to tag, tag_path(tag)}.join(", ")
	end

	
end
