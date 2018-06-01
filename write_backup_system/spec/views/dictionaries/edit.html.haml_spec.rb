require 'rails_helper'

RSpec.describe "dictionaries/edit", type: :view do
  before(:each) do
    @dictionary = assign(:dictionary, Dictionary.create!(
      :title => "MyString",
      :contents => "MyText",
      :status => "MyString",
      :publish => false
    ))
  end

  it "renders the edit dictionary form" do
    render

    assert_select "form[action=?][method=?]", dictionary_path(@dictionary), "post" do

      assert_select "input[name=?]", "dictionary[title]"

      assert_select "textarea[name=?]", "dictionary[contents]"

      assert_select "input[name=?]", "dictionary[status]"

      assert_select "input[name=?]", "dictionary[publish]"
    end
  end
end
