module BooksHelper


	def disable_or_destroy book
		if book.rating
			link_to "Disable", book_disable_path(book), data: { confirm: 'Are you sure?' }
		else
			link_to 'Destroy', book, method: :delete, data: { confirm: 'Are you sure?' }
		end
	end
end
