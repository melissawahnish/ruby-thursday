	require 'rails_helper'

	RSpec.describe Evaluation, type: :model do
	  describe ".by_starship" do
	  	it "returns evaluations for a starship" do
	  		starship_1 = FactoryGirl.create(:starship)
	  		starship_2 = FactoryGirl.create(:starship)
		  	crew_member_1 = FactoryGirl.create(:crew_member, 
					starship: starship_1
				)
				crew_member_2 = FactoryGirl.create(:crew_member, 
					starship: starship_2
				)
				crew_member_1_evaluation = FactoryGirl.create(:evaluation, 
					crew_member: crew_member_1
				)
				crew_member_2_evaluation = FactoryGirl.create(:evaluation, 
					crew_member: crew_member_2
				)

				results = Evaluation.by_starship(starship_1)
				expect(results).to include(crew_member_1_evaluation)
				expect(results).to_not include(crew_member_2_evaluation)
		  end
	  end

  describe ".recent" do
  	it "returns all recent evaluations" do
  		recent_evaluation = FactoryGirl.create(:evaluation)
			old_evaluation = FactoryGirl.create(:evaluation,  
				star_date: Date.today - 2.weeks
			)

			results = Evaluation.recent
			expect(results).to include(recent_evaluation)
			expect(results).to_not include(old_evaluation)
  	end
  end
end
