class Booking < ApplicationRecord
  # a booking has one user and one planet
  belongs_to :user
  belongs_to :planet
  has_one  :review, dependent: :destroy
  # can't create a booking without user/planet instance
  validates_associated :user
  validates_associated :planet
  # start/end dates (add checking later)
  validates :start, presence: true
  validates :end, presence: true
  # don't need to validate duration  as it can be calculated automatically
  # don't need to validate cost as it can be calculated automatically
  # completed and approved will be false by default
end
