class Evaluation < ApplicationRecord
  belongs_to :crew_member
  enum rating: [:poor, :acceptable, :excellent]
end
