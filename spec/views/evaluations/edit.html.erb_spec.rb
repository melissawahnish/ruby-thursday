# require 'rails_helper'

# RSpec.describe "evaluations/edit", type: :view do
#   before(:each) do
#     @evaluation = assign(:evaluation, Evaluation.create!(
#       :star_date => "MyString",
#       :date => "MyString",
#       :assessment => "MyText",
#       :rating => 1,
#       :crew_member => nil
#     ))
#   end

#   it "renders the edit evaluation form" do
#     render

#     assert_select "form[action=?][method=?]", evaluation_path(@evaluation), "post" do

#       assert_select "input#evaluation_star_date[name=?]", "evaluation[star_date]"

#       assert_select "input#evaluation_date[name=?]", "evaluation[date]"

#       assert_select "textarea#evaluation_assessment[name=?]", "evaluation[assessment]"

#       assert_select "input#evaluation_rating[name=?]", "evaluation[rating]"

#       assert_select "input#evaluation_crew_member_id[name=?]", "evaluation[crew_member_id]"
#     end
#   end
# end
