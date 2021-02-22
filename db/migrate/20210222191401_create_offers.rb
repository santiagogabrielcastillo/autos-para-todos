class CreateOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :offers do |t|
      t.boolean :publish
      t.integer :price
      t.date :starting_date
      t.date :finish_date
      t.references :user, null: false, foreign_key: true
      t.references :automobile, null: false, foreign_key: true

      t.timestamps
    end
  end
end
