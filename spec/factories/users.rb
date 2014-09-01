require 'rails_helper.rb'

FactoryGirl.define do

	sequence(:email) {|n| "email{n}@wesome.com"}

	factory :user do
		email "test@test.com"
		password "facebook"
		password_confirmation "facebook"

		factory :admin do
	        after(:create) {|user| user.add_role(:admin)}
		end

		factory :restricted do
			after(:create) {|user| user.add_role(:restricted)}
		end
	end

end