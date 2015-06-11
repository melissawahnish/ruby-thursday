class AddEmailToStarship < ActiveRecord::Migration
  def change
    add_column :starships, :email, :string
  end
end
