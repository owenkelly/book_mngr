require 'rails_helper.rb'

describe "Book Integration", type: :feature do
	
	context "new" do

		it "should create a new book" do
			visit new_book_path
			fill_in "Title", with: "Trees are cool"
			fill_in "Author", with: "Bojack Horseman"
			fill_in "ISBN", with: 1234567890123
			attach_file "Cover", "#{Rails.root}/spec/fixtures/test.jpg" 
			book_count = Book.count
			click_link_or_button "Create Book"
			expect(Book.count).to eq(book_count+1)
		end

		it "should reject a book without any parameters" do
			book = Book.create
			expect(book).to be_invalid
		end
	end


	context 'edit' do

		it "should allow for a book to be edited" do
			book = create(:book)
			visit edit_book_path(book)
			fill_in "Title", with: "I, Ninja"
			click_link_or_button "Update Book"
			expect(book.reload.title).to eq("I, Ninja")
		end

	end


	context 'show' do
		it "should display the book's infomation on its page" do
			book = create(:book)
			visit book_path(book)
			expect(page).to have_content(book.title)
		end

		it "should display many book on the index page" do
			book_list = create_list(:book, 10)
			n = rand(0..9)
			visit books_path
			expect(page).to have_content(book_list[n].title)
		end
	end

	context 'delete' do

		it "should delete a book without reviews" do
			book = create(:book)
			visit book_path(book)
			expect { click_link('Delete Book') }.to change(Book, :count).by(-1)
		end

		it "should disable a book with a review" do
			review = create(:review)
			visit book_path(review.book)
			puts review.rating
			click_link_or_button "Disable Book"
			expect(review.book.reload.active).to not_eq(true)
		end


	end



end