class CreateEvaluations < ActiveRecord::Migration[5.0]
  def change
    create_table :evaluations do |t|
      t.date :star_date
      t.text :assessment
      t.integer :rating
      t.belongs_to :crew_member, foreign_key: true

      t.timestamps
    end
  end
end
