require 'rails_helper'

RSpec.describe "reviews/new", :type => :view do
  before(:each) do
    assign(:review, Review.new(
      :rating => "",
      :review => "",
      :book_id => ""
    ))
  end

  it "renders new review form" do
    render

    assert_select "form[action=?][method=?]", reviews_path, "post" do

      assert_select "input#review_rating[name=?]", "review[rating]"

      assert_select "input#review_review[name=?]", "review[review]"

      assert_select "input#review_book_id[name=?]", "review[book_id]"
    end
  end
end
