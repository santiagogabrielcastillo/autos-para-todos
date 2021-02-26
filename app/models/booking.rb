class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :automobile

  validates :starting_date, :finish_date, presence: true
end
