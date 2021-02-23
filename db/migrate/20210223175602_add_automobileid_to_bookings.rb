class AddAutomobileidToBookings < ActiveRecord::Migration[6.0]
  def change
    add_reference :bookings, :automobile, null: false, foreign_key: true
  end
end
