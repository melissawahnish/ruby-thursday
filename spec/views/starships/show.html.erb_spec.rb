require 'rails_helper'

RSpec.describe "starships/show", type: :view do
  before(:each) do
    @starship = assign(:starship, Starship.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
