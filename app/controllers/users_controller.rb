class UsersController < ApplicationController
	before_filter :authenticate_user!
	load_and_authorize_resource

	def profile

	end


	def admin

	end

end
