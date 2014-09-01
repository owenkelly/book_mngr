require 'rails_helper.rb'


describe "Admin Integration", type: :feature do

	context "promoting admins" do
		before :each do
			@admin = FactoryGirl.create(:admin, email: "admin@test.com")
			login_as(@admin)
		end

		it "should allow for an admin to promote another user to admin" do
			user = create(:user)
			visit admin_path
			click_button "Make Admin"
			expect(user.has_role? :admin).to be(true)
		end

		it "should allow for a restricted user to be unrestricted" do
			user = create(:restricted)
			visit admin_path
			click_button "Unrestrict User"
			expect(user.has_role? :restricted).to be(false)
		end





	


	end






end