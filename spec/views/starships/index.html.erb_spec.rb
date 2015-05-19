require 'rails_helper'

RSpec.describe "starships/index", type: :view do
  before(:each) do
    assign(:starships, [
      Starship.create!(
        :name => "Name"
      ),
      Starship.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of starships" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
