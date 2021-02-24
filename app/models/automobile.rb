CATEGORIES = ["Automóvil", "Motocicleta", "Camioneta", "Camión"]

class Automobile < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  has_one_attached :photo

  belongs_to :user
  has_many :reviews, as: :reviewable
end
