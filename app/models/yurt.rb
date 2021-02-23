class Yurt < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :photo
  validates :title, :description, :location, :max_capacity, :day_rate, presence: true
end
