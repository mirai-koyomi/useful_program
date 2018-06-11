require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :screen_name => "Screen Name",
        :name => "Name",
        :password_digest => "Password Digest",
        :description => "MyText",
        :comment => "MyText"
      ),
      User.create!(
        :screen_name => "Screen Name",
        :name => "Name",
        :password_digest => "Password Digest",
        :description => "MyText",
        :comment => "MyText"
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "Screen Name".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Password Digest".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
