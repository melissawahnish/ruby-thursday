require "rails_helper"

RSpec.describe FromTheBridgeMailer, type: :mailer do
  describe "send_newsletter" do
    let(:mail) { FromTheBridgeMailer.send_newsletter }

    it "renders the headers" do
      expect(mail.subject).to eq("Send newsletter")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
