module BooksHelper


def disable_or_destroy
	if book.has_reviews?
		link_to book.disable
	else
		book

end
