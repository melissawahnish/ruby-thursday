class HolodeckProgram < ApplicationRecord
	belongs_to :starship
  belongs_to :crew_member
end
