CATEGORIES = ["Automóvil", "Motocicleta", "Camioneta", "Camión"]

class Automobile < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  has_many :reviews, as: :reviewable
end
