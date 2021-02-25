class AddCoordinatesToAutomobiles < ActiveRecord::Migration[6.0]
  def change
    add_column :automobiles, :latitude, :float
    add_column :automobiles, :longitude, :float
  end
end
