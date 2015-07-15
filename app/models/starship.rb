class Starship < ActiveRecord::Base
	has_many :crew_members
  accepts_nested_attributes_for :crew_members,
    reject_if: lambda {|attributes| attributes["name"].blank?},
    allow_destroy: true
  has_many :holodeck_programs  
	accepts_nested_attributes_for :holodeck_programs,
    reject_if: lambda {|attributes| attributes["title"].blank?}
    
  validates_presence_of :name
end
