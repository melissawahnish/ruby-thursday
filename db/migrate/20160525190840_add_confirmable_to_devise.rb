class AddConfirmableToDevise < ActiveRecord::Migration
  def change
  	add_column :hackers, :confirmation_token, :string
		add_column :hackers, :confirmed_at, :datetime
		add_column :hackers, :confirmation_sent_at, :datetime
		add_index :hackers, :confirmation_token, unique: true
		execute("UPDATE hackers SET confirmed_at = NOW()")
  end
end
