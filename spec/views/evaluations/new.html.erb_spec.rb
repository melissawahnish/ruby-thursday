require 'rails_helper'

RSpec.describe "evaluations/new", type: :view do
  before(:each) do
    assign(:evaluation, Evaluation.new(
      :star_date => "MyString",
      :date => "MyString",
      :assessment => "MyText",
      :rating => 1,
      :crew_member => nil
    ))
  end

  it "renders new evaluation form" do
    render

    assert_select "form[action=?][method=?]", evaluations_path, "post" do

      assert_select "input#evaluation_star_date[name=?]", "evaluation[star_date]"

      assert_select "input#evaluation_date[name=?]", "evaluation[date]"

      assert_select "textarea#evaluation_assessment[name=?]", "evaluation[assessment]"

      assert_select "input#evaluation_rating[name=?]", "evaluation[rating]"

      assert_select "input#evaluation_crew_member_id[name=?]", "evaluation[crew_member_id]"
    end
  end
end
