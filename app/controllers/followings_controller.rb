class FollowingsController < ApplicationController
	before_action :set_book
	
	def create
		@following = current_user.followings.build(book_id: @book.id)
		if @following.save
    		redirect_to @book, notice: "This book has been added to your follow list"
  		else
		    redirect_to @book, notice: "Unable to add this book to your follow list"
		end
	end


	def destroy
		@following = Following.where(book_id: @book.id, user_id: @user.id)
		@following.destroy_all
		redirect_to @book, notice: "You are no longer following this book"
	end

	private

	def review_params
      params.require(:following).permit(:book_id, :user_id)
    end



    private

    def set_book
   		@book = Book.find(params[:book_id])
   	end

    

end
