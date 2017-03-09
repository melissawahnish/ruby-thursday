class Evaluation < ApplicationRecord
  belongs_to :crew_member
  delegate :name, to: :crew_member, prefix: true, allow_nil: true
  enum rating: [:poor, :acceptable, :excellent]

  scope :by_starship, ->(starship) { joins(:crew_member).
  	merge(CrewMember.where(starship_id: starship.id)) if starship.present?
  }
  scope :recent, -> { where("star_date > ?", Date.today - 1.week ) }
end
