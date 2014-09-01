require "rails_helper.rb"


describe UsersController, :type => :controller do


	context "admin tasks in the controller" do

		before :each do
			@admin = FactoryGirl.create(:admin, email: "admin@test.com")
			sign_in @admin
		end

		it "should not allow a restricted user to become an admin" do
			user = create(:restricted)
			post :adminize, id: user
			expect(response).to redirect_to(admin_path)
		end

		it "should not allow an admin to be restricted" do
			user = create(:admin)
			post :restrict, id: user
			expect(response).to redirect_to(admin_path)
		end

		it "should reject a method being called on a user that already has that status" do
			user = create(:user)
			post :unrestrict, id: user
			expect(response).to redirect_to(admin_path)
		end
	end

end
