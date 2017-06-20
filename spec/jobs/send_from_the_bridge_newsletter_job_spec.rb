require 'rails_helper'

RSpec.describe SendFromTheBridgeNewsletterJob, type: :job do
  let(:hackers) { FactoryGirl.create_list(:hacker, 5) }

  before do
	  ActiveJob::Base.queue_adapter.enqueued_jobs.clear
	end

	it "sends newsletter emails to all hackers (aka users)" do
    SendFromTheBridgeNewsletterJob.perform_now(hackers)
    expect(ActiveJob::Base.queue_adapter.enqueued_jobs.size).to eq 5
  end
end
