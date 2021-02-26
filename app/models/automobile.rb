CATEGORIES = ["Automóvil", "Motocicleta", "Camioneta", "Camión"]

class Automobile < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  has_one_attached :photo

  belongs_to :user
  has_many :reviews, as: :reviewable

  include PgSearch::Model
  pg_search_scope :search_by_automobiles_model_and_brand, against: [:model, :brand], using: { tsearch: { prefix: true } }

  pg_search_scope :search_by_automobiles_km, against: :km, using: { tsearch: { prefix: true } }

  pg_search_scope :search_by_automobiles_price, against: :price, using: { tsearch: { prefix: true } }

  def self.search(args)
    location_query = args[:location]
    price_query = args[:price]
    km_query = args[:km]
    model_brand_query = args[:model_brand]
    results = []

    if location_query
      by_location = Automobile.near(location_query)
      by_location.each { |instance| results << instance }
    end

    if price_query
      by_price = Automobile.search_by_automobiles_price(price_query)
      by_price.each { |instance| results << instance }
    end

    if km_query
      by_km = Automobile.search_by_automobiles_km(km_query)
      by_km.each { |instance| results << instance }
    end

    if model_brand_query
      by_model_brand = Automobile.search_by_automobiles_model_and_brand(model_brand_query)
      by_model_brand.each { |instance| results << instance }
    end

    return results
    # combine the results of by_location & by_model & 
  end
end

# match = Automobile.search("aa").with_pg_search_highlight (now i have available the .pg_search_highlight attribute)


