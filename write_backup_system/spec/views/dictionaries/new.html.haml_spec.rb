require 'rails_helper'

RSpec.describe "dictionaries/new", type: :view do
  before(:each) do
    assign(:dictionary, Dictionary.new(
      :title => "MyString",
      :contents => "MyText",
      :status => "MyString",
      :publish => false
    ))
  end

  it "renders new dictionary form" do
    render

    assert_select "form[action=?][method=?]", dictionaries_path, "post" do

      assert_select "input[name=?]", "dictionary[title]"

      assert_select "textarea[name=?]", "dictionary[contents]"

      assert_select "input[name=?]", "dictionary[status]"

      assert_select "input[name=?]", "dictionary[publish]"
    end
  end
end
