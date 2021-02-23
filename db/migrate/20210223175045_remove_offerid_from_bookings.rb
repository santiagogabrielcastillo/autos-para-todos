class RemoveOfferidFromBookings < ActiveRecord::Migration[6.0]
  def change
    remove_column :bookings, :offer_id
  end
end
