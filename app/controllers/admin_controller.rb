class AdminController < ApplicationController
  def hacker_list
  	authenticate_admin!
    @hackers = Hacker.all
  end
end
