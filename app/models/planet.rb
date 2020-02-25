class Planet < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  validates :description, presence: true
  validates :rate, presence: true, numericality: { greater_than: 0 }
  validates :capacity, presence: true, numericality: { greater_than: 0 }
  belongs_to :user
  # only 1 environment per planet for now
  belongs_to :environment
  has_many_attached :photos
end
