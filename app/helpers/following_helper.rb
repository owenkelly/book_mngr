module FollowingHelper


def following_toggle book
		@following = Following.where(user_id: current_user.id, book_id: book.id)
		if @following.length > 0
			link_to "Unfollow Book", book_following_path(@following, book, book_id: book), method: :delete
		else
			link_to "Follow Book", book_followings_path(book_id: book), method: :post
		end
	end

	

end
