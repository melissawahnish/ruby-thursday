class SendFromTheBridgeNewsletterJob < ApplicationJob
  queue_as :default

  def perform(hackers)
	  hackers.each do |hacker|
	    FromTheBridgeMailer.send_newsletter(hacker).deliver_later
	  end
	end
end
