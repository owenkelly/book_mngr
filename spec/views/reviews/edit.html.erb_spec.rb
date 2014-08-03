require 'rails_helper'

RSpec.describe "reviews/edit", :type => :view do
  before(:each) do
    @review = assign(:review, Review.create!(
      :rating => "",
      :review => "",
      :book_id => ""
    ))
  end

  it "renders the edit review form" do
    render

    assert_select "form[action=?][method=?]", review_path(@review), "post" do

      assert_select "input#review_rating[name=?]", "review[rating]"

      assert_select "input#review_review[name=?]", "review[review]"

      assert_select "input#review_book_id[name=?]", "review[book_id]"
    end
  end
end
