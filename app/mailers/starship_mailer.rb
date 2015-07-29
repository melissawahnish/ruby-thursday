class StarshipMailer < ApplicationMailer
	default from: ENV["EMAILUSERNAME"]

  def starship_created_email(starship)
    @starship = starship
    mail( to: @starship.email,
    subject: 'Starship Created' )
  end
end
