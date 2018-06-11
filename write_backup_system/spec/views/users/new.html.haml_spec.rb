require 'rails_helper'

RSpec.describe "users/new", type: :view do
  before(:each) do
    assign(:user, User.new(
      :screen_name => "MyString",
      :name => "MyString",
      :password_digest => "MyString",
      :description => "MyText",
      :comment => "MyText"
    ))
  end

  it "renders new user form" do
    render

    assert_select "form[action=?][method=?]", users_path, "post" do

      assert_select "input[name=?]", "user[screen_name]"

      assert_select "input[name=?]", "user[name]"

      assert_select "input[name=?]", "user[password_digest]"

      assert_select "textarea[name=?]", "user[description]"

      assert_select "textarea[name=?]", "user[comment]"
    end
  end
end
