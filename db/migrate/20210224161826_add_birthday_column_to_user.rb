class AddBirthDateColumnToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :birth_date, :string
  end
end
