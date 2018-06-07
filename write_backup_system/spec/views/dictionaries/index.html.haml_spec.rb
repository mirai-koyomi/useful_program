require 'rails_helper'

RSpec.describe "dictionaries/index", type: :view do
  before(:each) do
    assign(:dictionaries, [
      Dictionary.create!(
        :title => "Title",
        :contents => "MyText",
        :status => "Status",
        :publish => false
      ),
      Dictionary.create!(
        :title => "Title",
        :contents => "MyText",
        :status => "Status",
        :publish => false
      )
    ])
  end

  it "renders a list of dictionaries" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
