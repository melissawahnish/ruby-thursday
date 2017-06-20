class FromTheBridgeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.from_the_bridge_mailer.send_newsletter.subject
  #
  def send_newsletter(hacker)
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
