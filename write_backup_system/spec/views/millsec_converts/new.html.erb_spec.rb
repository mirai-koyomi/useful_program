require 'rails_helper'

RSpec.describe "millsec_converts/new", type: :view do
  before(:each) do
    assign(:millsec_convert, MillsecConvert.new(
      :millsec => 1.5,
      :comment => "MyString"
    ))
  end

  it "renders new millsec_convert form" do
    render

    assert_select "form[action=?][method=?]", millsec_converts_path, "post" do

      assert_select "input[name=?]", "millsec_convert[millsec]"

      assert_select "input[name=?]", "millsec_convert[comment]"
    end
  end
end
