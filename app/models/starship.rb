class Starship < ActiveRecord::Base
	has_many :crew_members
  accepts_nested_attributes_for :crew_members,
    reject_if: lambda {|attributes| attributes["name"].blank?},
    allow_destroy: true
    
  validates_presence_of :name
end
