class UsersController < ApplicationController
	before_filter :authenticate_user!
	load_and_authorize_resource

	def profile
		if user.has_role? :admin
			admin
			render :admin
		end

	end


	def admin
		@users = Users.all

	end

end
