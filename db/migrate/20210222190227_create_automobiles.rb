class CreateAutomobiles < ActiveRecord::Migration[6.0]
  def change
    create_table :automobiles do |t|
      t.string :model
      t.string :brand
      t.string :category
      t.integer :year
      t.integer :km
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
