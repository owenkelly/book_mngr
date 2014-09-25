require 'rails_helper.rb'

FactoryGirl.define do

	sequence(:title) {|n| "Title #{n}"}
	sequence(:author) {|n| "Author #{n}"}
	sequence(:isbn) {|n| 1234567890000 + n }
	sequence(:review_text) {|n| "Review #{n}"}

	
	factory :book do
		title 
		author 
		isbn
		approved true
		tag_list "TAGGED"
		cover Rack::Test::UploadedFile.new(File.open("#{Rails.root}/spec/fixtures/test.jpg"))

		factory :followed_book do
			after(:create) {|book| book.followers << FactoryGirl.create(:follower) } 
		end	
	end

	factory :following do
		user_id
		book_id
		setting "rating"
	end


	factory :review do
		rating 4
		review_text
		book
	end


	factory :follower, class: User do
		email "follower@follows.com"
		password "facebook"
		password_confirmation "facebook"
	end


end