require "rails_helper.rb"


describe ReviewsController, :type => :controller do
	before :each do
			@user = FactoryGirl.create(:user)
			sign_in @user
		end

		it "should post a review is made" do
			book = FactoryGirl.create(:followed_book)
			post :create, :book_id => book, :review => {:rating => 4, :review_text => "The Best", :book_id => book.id, :user_id => @user.id}
			expect(response).to redirect_to(book_path(book))
		end		
	

end