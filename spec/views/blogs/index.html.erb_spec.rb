require 'rails_helper'

RSpec.describe "blogs/index", type: :view do
  before(:each) do
    assign(:blogs, [
      Blog.create!(
        :name => "Name",
        :url => "Url",
        :user => nil
      ),
      Blog.create!(
        :name => "Name",
        :url => "Url",
        :user => nil
      )
    ])
  end

  it "renders a list of blogs" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
