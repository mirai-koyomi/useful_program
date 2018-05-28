require 'rails_helper'

RSpec.describe "millsec_converts/show", type: :view do
  before(:each) do
    @millsec_convert = assign(:millsec_convert, MillsecConvert.create!(
      :millsec => 2.5,
      :comment => "Comment"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(/Comment/)
  end
end
