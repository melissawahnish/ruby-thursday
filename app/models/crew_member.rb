class CrewMember < ApplicationRecord
	belongs_to :starship, optional: true
	accepts_nested_attributes_for :starship,
    reject_if: lambda {|attributes| attributes["name"].blank?}
  has_many :holodeck_programs, through: :starship 
  has_many :evaluations
end
