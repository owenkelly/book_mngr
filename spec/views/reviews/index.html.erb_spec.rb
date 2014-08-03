require 'rails_helper'

RSpec.describe "reviews/index", :type => :view do
  before(:each) do
    assign(:reviews, [
      Review.create!(
        :rating => "",
        :review => "",
        :book_id => ""
      ),
      Review.create!(
        :rating => "",
        :review => "",
        :book_id => ""
      )
    ])
  end

  it "renders a list of reviews" do
    render
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
