require "rails_helper"

RSpec.describe Devise::Mailer do
	it "sends a confirmation email to correct email with custom text" do
    hacker = FactoryGirl.create(:hacker, confirmed_at: nil)

    confirmation_email = Devise.mailer.deliveries.last
    
    expect(hacker.email).to eq confirmation_email.to[0]
    expect(confirmation_email.body.to_s).to have_content 'As Picard says, "Engage!"'
  end  
end