# Preview all emails at http://localhost:3000/rails/mailers/from_the_bridge
class FromTheBridgePreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/from_the_bridge/send_newsletter
  def send_newsletter
    FromTheBridgeMailer.send_newsletter
  end

end
