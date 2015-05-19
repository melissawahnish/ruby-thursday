require 'rails_helper'

RSpec.describe "starships/new", type: :view do
  before(:each) do
    assign(:starship, Starship.new(
      :name => "MyString"
    ))
  end

  it "renders new starship form" do
    render

    assert_select "form[action=?][method=?]", starships_path, "post" do

      assert_select "input#starship_name[name=?]", "starship[name]"
    end
  end
end
