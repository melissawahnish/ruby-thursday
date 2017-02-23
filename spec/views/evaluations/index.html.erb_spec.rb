# require 'rails_helper'

# RSpec.describe "evaluations/index", type: :view do
#   before(:each) do
#     assign(:evaluations, [
#       Evaluation.create!(
#         :star_date => "Star Date",
#         :date => "Date",
#         :assessment => "MyText",
#         :rating => 2,
#         :crew_member => nil
#       ),
#       Evaluation.create!(
#         :star_date => "Star Date",
#         :date => "Date",
#         :assessment => "MyText",
#         :rating => 2,
#         :crew_member => nil
#       )
#     ])
#   end

#   it "renders a list of evaluations" do
#     render
#     assert_select "tr>td", :text => "Star Date".to_s, :count => 2
#     assert_select "tr>td", :text => "Date".to_s, :count => 2
#     assert_select "tr>td", :text => "MyText".to_s, :count => 2
#     assert_select "tr>td", :text => 2.to_s, :count => 2
#     assert_select "tr>td", :text => nil.to_s, :count => 2
#   end
# end
