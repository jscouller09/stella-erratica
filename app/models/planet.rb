class Planet < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  validates :description, presence: true
  validates :rate, presence: true
  belongs_to :user
  belongs_to :environment
  has_many_attached :photos
end
