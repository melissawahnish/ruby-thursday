class Admin::HackersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @hackers = Hacker.all
  end
end
