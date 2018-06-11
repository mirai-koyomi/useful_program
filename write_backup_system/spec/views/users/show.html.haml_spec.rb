require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :screen_name => "Screen Name",
      :name => "Name",
      :password_digest => "Password Digest",
      :description => "MyText",
      :comment => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Screen Name/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Password Digest/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
  end
end
