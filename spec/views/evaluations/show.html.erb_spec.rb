require 'rails_helper'

RSpec.describe "evaluations/show", type: :view do
  before(:each) do
    @evaluation = assign(:evaluation, Evaluation.create!(
      :star_date => "Star Date",
      :date => "Date",
      :assessment => "MyText",
      :rating => 2,
      :crew_member => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Star Date/)
    expect(rendered).to match(/Date/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(//)
  end
end
