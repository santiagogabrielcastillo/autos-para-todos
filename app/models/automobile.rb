CATEGORIES = ["Automóvil", "Motocicleta", "Camioneta", "Camión"]

class Automobile < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  has_one_attached :photo

  belongs_to :user
  has_many :reviews, as: :reviewable

  include PgSearch::Model
  pg_search_scope :search_by_automobiles_brand, against: :brand, using: { tsearch: { prefix: true } }

  pg_search_scope :search_by_automobiles_model, against: :model, using: { tsearch: { prefix: true } }

  pg_search_scope :search_by_automobiles_year, against: :year, using: { tsearch: { prefix: true } }

  pg_search_scope :search_by_automobiles_km, against: :km, using: { tsearch: { prefix: true } }

  pg_search_scope :search_by_automobiles_price, against: :price, using: { tsearch: { prefix: true } }

  def self.search(args)
    location_query = args[:location]
    price_query = args[:price]
    km_query = args[:km]
    year_query = args[:year]
    model_query = args[:model]
    brand_query = args[:brand]
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

    if year_query
      by_year = Automobile.search_by_automobiles_year(year_query)
      by_year.each { |instance| results << instance }
    end

    if model_query
      by_model = Automobile.search_by_automobiles_model(model_query)
      by_model.each { |instance| results << instance }
    end

    if brand_query
      by_brand = Automobile.search_by_automobiles_brand(brand_query)
      by_brand.each { |instance| results << instance }
    end

    return results
    # combine the results of by_location & by_model & 
  end
end

# match = Automobile.search("aa").with_pg_search_highlight (now i have available the .pg_search_highlight attribute)


