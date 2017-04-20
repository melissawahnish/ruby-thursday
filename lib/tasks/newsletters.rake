namespace :newsletters do
  desc "Send weekly newsletter from the Captain"
  task from_the_bridge: :environment do
    SendFromTheBridgeNewsletterJob.perform_later
  end
end
