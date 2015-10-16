class AddBioToCrewMember < ActiveRecord::Migration
  def change
    add_column :crew_members, :bio, :text
  end
end
