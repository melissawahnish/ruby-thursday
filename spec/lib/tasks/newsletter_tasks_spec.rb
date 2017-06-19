require 'rails_helper'

RSpec.describe "newsletters:from_the_bridge" do

  before do
    ActiveJob::Base.queue_adapter.enqueued_jobs.clear
  end
  it "schedules background job to perform soon" do
    subject.execute
    expect(ActiveJob::Base.queue_adapter.enqueued_jobs.size).to eq 1
  end
		
end