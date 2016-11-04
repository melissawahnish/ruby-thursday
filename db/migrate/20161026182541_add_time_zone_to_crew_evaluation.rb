class AddTimeZoneToCrewEvaluation < ActiveRecord::Migration[5.0]
  def change
  	add_column :evaluations, :time_zone, :string
  	add_column :evaluations, :evaluation_time, :datetime
  end
end
