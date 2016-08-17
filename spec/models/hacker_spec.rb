require 'rails_helper'

RSpec.describe Hacker, type: :model do
  describe "after creation" do 
	  it "sends a confirmation email" do
	    hacker = FactoryGirl.build(:hacker, confirmed_at: nil)

	    expect { hacker.save }.to change(
	      Devise.mailer.deliveries, :count
	    ).by(1)
	  end  
	end
end
