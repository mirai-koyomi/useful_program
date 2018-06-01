require 'rails_helper'

RSpec.describe "dictionaries/show", type: :view do
  before(:each) do
    @dictionary = assign(:dictionary, Dictionary.create!(
      :title => "Title",
      :contents => "MyText",
      :status => "Status",
      :publish => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Status/)
    expect(rendered).to match(/false/)
  end
end
