class FollowingsController < ApplicationController
	before_action :set_book, only: [:create, :destroy]
	
	
	def create
		@following = current_user.followings.build(book_id: @book.id)
    	redirect_to @book, notice: "This book has been added to your follow list" if @following.save
	end


	def destroy
		@following = Following.where(book_id: @book.id, user_id: @user.id)
		@following.destroy_all
		redirect_to @book, notice: "You are no longer following this book"
	end



	def update
		@following = Following.find(params[:id])
		redirect_to :back if @following.update(following_params)    
    end



	private

	def following_params
      params.require(:following).permit(:book_id, :user_id, :setting)
    end

    

    



    private

    def set_book
   		@book = Book.find(params[:book_id])
   	end

    

end
