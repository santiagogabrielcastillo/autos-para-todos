CATEGORIES = ["Automóvil", "Motocicleta", "Camioneta", "Camión"]

class Automobile < ApplicationRecord
  validates :brand, :model, :year, :category, :price, :address, :km, :photo, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  has_one_attached :photo

  belongs_to :user
  has_many :reviews, as: :reviewable
  has_many :bookings, dependent: :destroy

  include PgSearch::Model
  pg_search_scope :search_by_automobiles_columns,
                  against: %i[model brand year km],
                  using: {
                    tsearch: { prefix: true }
                  }
end
