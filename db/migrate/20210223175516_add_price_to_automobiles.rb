class AddPriceToAutomobiles < ActiveRecord::Migration[6.0]
  def change
    add_column :automobiles, :price, :integer
  end
end
