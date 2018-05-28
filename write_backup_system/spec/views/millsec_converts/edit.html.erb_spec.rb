require 'rails_helper'

RSpec.describe "millsec_converts/edit", type: :view do
  before(:each) do
    @millsec_convert = assign(:millsec_convert, MillsecConvert.create!(
      :millsec => 1.5,
      :comment => "MyString"
    ))
  end

  it "renders the edit millsec_convert form" do
    render

    assert_select "form[action=?][method=?]", millsec_convert_path(@millsec_convert), "post" do

      assert_select "input[name=?]", "millsec_convert[millsec]"

      assert_select "input[name=?]", "millsec_convert[comment]"
    end
  end
end
