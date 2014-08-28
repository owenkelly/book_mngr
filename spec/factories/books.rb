require 'rails_helper.rb'

FactoryGirl.define do

	sequence(:title) {|n| "Title #{n}"}
	sequence(:author) {|n| "Author #{n}"}
	sequence(:isbn) {|n| 1234567890000 + n }

	
	factory :book do
		title 
		author 
		isbn 
		cover Rack::Test::UploadedFile.new(File.open("#{Rails.root}/spec/fixtures/test.jpg"))
	end


	factory :review do
		rating 4
		review "BEST BOOK 4 EVAR"
		book
	end

end