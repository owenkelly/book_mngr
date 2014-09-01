require 'rails_helper.rb'

describe "User Integration", type: :feature do


	context "user creation" do

		it "should allow for the creation of a user" do
			visit new_user_registration_path
			fill_in "Email", with: "hi@mom.com"
			fill_in "Password", with: "beerbeer"
			fill_in "Password confirmation", with: "beerbeer"
			expect { click_button('Sign up') }.to change(User, :count).by(1)
		end

	end

	context "user permissions" do

		before :each do
			@user = FactoryGirl.create(:user)
			login_as(@user, :scope => :user)
		end


		it "should not allow one user to user to edit another's book" do
			bad_user = create(:user, email: "bad@worse.com")
			book = create(:book, user: bad_user)
			visit book_path(book)
			click_link "Edit Book Information"
			expect(page).to have_content("Not allowed to edit books you didn't create!")
		end

		it "should allow an admin to edit another user's book" do
			admin = create(:admin, email: "admin@test.com")
			book = create(:book, user: @user)
			logout(@user)
			login_as(admin)
			visit book_path(book)
			click_link "Edit Book Information"
			fill_in "Title", with: "The Big Fish"
			click_button "Update Book"
			expect(book.reload.title).to eq("The Big Fish")
		end

		it "should not allow a restrited user to create a review" do
			restricted = create(:restricted, email: "restricted@test.com")
			book = create(:book, user: @user)
			logout(@user)
			login_as(restricted)
			visit book_path(book)
			click_link "New Review"
			expect(page).to have_content("Your ability to create new reviews has been suspended.")
		end

	end


end