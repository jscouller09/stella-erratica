class Planet < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  validates :description, presence: true
  validates :rate, presence: true, numericality: { greater_than: 0 }
  validates :capacity, presence: true, numericality: { greater_than: 0 }
  belongs_to :user
  belongs_to :environment
  has_many_attached :photos
end
