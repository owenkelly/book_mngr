module FollowingHelper


def following_toggle book
		@following = Following.where(user_id: current_user, book_id: book.id)
		if @following.length > 0
			link_to "Unfollow Book", following_path(@following, book_id: book), method: :delete
		else
			link_to "Follow Book", followings_path(book_id: book), method: :post
		end
	end

	

end
