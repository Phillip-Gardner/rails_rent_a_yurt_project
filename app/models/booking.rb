class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :yurt

  validates :booked_from, :booked_to, :user_id, :yurt_id, presence: true
  # validates :booked_from, uniqueness: {scope: :yurt}
end
