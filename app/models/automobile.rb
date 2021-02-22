class Automobile < ApplicationRecord
  belongs_to :user
  has_many :reviews, as: :reviewable
end
