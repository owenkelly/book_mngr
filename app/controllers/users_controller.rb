class UsersController < ApplicationController
	before_filter :authenticate_user!
	load_and_authorize_resource

	def profile
		#if @user.has_role? :admin
			#admin
			#render :admin
		#end

	end


	def admin
		@admins = User.with_role(:admin)
		@restricted = User.with_role(:restricted)
		@users = User.all - @admins - @restricted
	end

	def adminize
		user = User.find(params[:id])
		return redirect_to admin_path if user.adminize!
		redirect_to admin_path, notice: 'Problem adding permission'
	end

	def restrict
		user = User.find(params[:id])
		return redirect_to admin_path if user.restrict!
		redirect_to admin_path, notice: 'Problem restricting permissions'
	end

	def unrestrict
		user = User.find(params[:id])
		return redirect_to admin_path if user.unrestrict!
	end

end
