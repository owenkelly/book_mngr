module UsersHelper


	def admin_toggle user
		if user.has_any_role? :admin, :restricted
			"---------"
		else
			button_to "Make Admin", adminize_path(user)
		end

	end


	def restricted_toggle user
		if user.has_role? :restricted
			button_to "Unrestirct User", unrestrict_path(user)
		elsif user.has_role? :admin
			'-----'		
		else
			button_to "Restrict User", restrict_path(user)
		end
	end



	

end
	