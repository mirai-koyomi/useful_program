require 'rails_helper'

RSpec.describe "millsec_converts/index", type: :view do
  before(:each) do
    assign(:millsec_converts, [
      MillsecConvert.create!(
        :millsec => 2.5,
        :comment => "Comment"
      ),
      MillsecConvert.create!(
        :millsec => 2.5,
        :comment => "Comment"
      )
    ])
  end

  it "renders a list of millsec_converts" do
    render
    assert_select "tr>td", :text => 2.5.to_s, :count => 2
    assert_select "tr>td", :text => "Comment".to_s, :count => 2
  end
end
