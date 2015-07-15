class HolodeckProgram < ActiveRecord::Base
	belongs_to :starship
  belongs_to :crew_member
end
