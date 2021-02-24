class User < ApplicationRecord
  has_one_attached :photo
  has_many :bookings, dependent: :destroy
  has_many :automobiles, dependent: :destroy
  has_many :reviews, as: :reviewable
  has_many :performed_reviews, class_name: "Review", foreign_key: "user_id" 
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
