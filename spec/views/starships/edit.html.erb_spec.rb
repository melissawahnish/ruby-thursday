require 'rails_helper'

RSpec.describe "starships/edit", type: :view do
  before(:each) do
    @starship = assign(:starship, Starship.create!(
      :name => "MyString"
    ))
  end

  it "renders the edit starship form" do
    render

    assert_select "form[action=?][method=?]", starship_path(@starship), "post" do

      assert_select "input#starship_name[name=?]", "starship[name]"
    end
  end
end
