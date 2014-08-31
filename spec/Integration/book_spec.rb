require 'rails_helper.rb'

describe "Book and Review Integration", type: :feature do
	before :each do
		@user = FactoryGirl.create(:user)
		login_as(@user, :scope => :user)
	end
	
	context "new" do

		it "should create a new book" do
			visit new_book_path
			fill_in "Title", with: "Trees are cool"
			fill_in "Author", with: "Bojack Horseman"
			fill_in "ISBN", with: 1234567890123
			fill_in "Tags, seperated by commas", with: "tag, tag2"
			attach_file "Cover", "#{Rails.root}/spec/fixtures/test.jpg" 
			expect { click_button('Create Book') }.to change(Book, :count).by(+1)
		end

		it "should reject a book without any parameters" do
			book = Book.create
			expect(book).to be_invalid
		end


		it "should reject a review without a rating" do
			book = create(:book, user: @user)
			visit new_book_review_path(book)
			fill_in "Review", with: "I like turtles"
			click_link_or_button "Create Review"
			expect(page).to have_content("Rating can't be blank")
		end


	end


	context 'edit' do

		it "should allow for a book to be edited" do
			book = create(:book, user: @user)
			visit edit_book_path(book)
			fill_in "Title", with: "I, Ninja"
			click_link_or_button "Update Book"
			expect(book.reload.title).to eq("I, Ninja")
		end

		it "should reject an edit which removes a key field" do
			book = create(:book, user: @user)
			visit edit_book_path(book)
			fill_in "Title", with: ""
			click_link_or_button "Update Book"
			expect(page).to have_content("Title can't be blank")
		end

		it "should allow for a review to be updated" do
			review = create(:review, user: @user)
			visit edit_book_review_path(review.book, review)
			fill_in "Review", with: "I feel like chicken tonight!"
			click_link_or_button "Update Review"
			expect(review.reload.review_text).to eq("I feel like chicken tonight!")

		end


	end


	context 'show' do

		it "should display the book's infomation on its page" do
			book = create(:book)
			visit book_path(book)
			expect(page).to have_content(book.title)
		end

		it "should allow searching through reviews" do
			review = create(:review, user: @user)
			visit book_path(review.book)
			select "Rating", from: "q[c][0][a][0][name]"
			select "not equal to", from: "q[c][0][p]" 
			fill_in "q[c][0][v][0][value]", with: "#{review.rating}"
			click_link_or_button "Search"
			expect(page).not_to have_content(review.review_text)
		end

		it "should display many book on the index page" do
			book_list = create_list(:book, 10)
			n = rand(0..9)
			visit books_path
			expect(page).to have_content(book_list[n].title)
		end

		it "should search via parameters in the index" do
			book_list = create_list(:book, 10)
			visit books_path
			select "Isbn", from: "q[c][0][a][0][name]"
			select "not equal to", from: "q[c][0][p]" 
			fill_in "q[c][0][v][0][value]", with: "#{book_list.first.isbn}"
			click_link_or_button "Search"
			expect(page).not_to have_content(book_list.first.isbn)
		end

		it "should filter tags by clicking on them" do
			book = create(:book, tag_list: "BUTTER")
			book_list = create_list(:book, 10)
			visit books_path
			click_link_or_button "BUTTER"
			expect(page).not_to have_content("TAGGED")
		end 

		it "should sort by rating by clicking on the sort coloumn" do
			book = create(:book, rating: 5)
			book_list = create_list(:book, 5)
			visit books_path
			click_link_or_button "Rating"
			click_link_or_button "Rating"
			expect(page).to have_selector("table tr:nth-child(1)", exact: book.rating)
		end

	end

	context 'delete' do

		it "should delete a book without reviews" do
			book = create(:book, user: @user)
			visit book_path(book)
			expect { click_link('Delete Book') }.to change(Book, :count).by(-1)
		end

		it "should disable a book with a review" do
			review = create(:review, user: @user)
			visit book_path(review.book)
			click_link_or_button "Disable Book"
			expect(review.book.reload.active).not_to be(true)
		end

		it "should allow deletion of a review" do
			review = create(:review, user: @user)
			visit book_path(review.book)
			expect {click_link('Delete Review')}.to change(Review, :count).by(-1)
		end

	end


end