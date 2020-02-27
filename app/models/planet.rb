class Planet < ApplicationRecord
  include PgSearch::Model
  validates :name, uniqueness: true, presence: true
  validates :description, presence: true
  validates :rate, presence: true, numericality: { greater_than: 0 }
  validates :capacity, presence: true, numericality: { greater_than: 0 }
  belongs_to :user
  # updated to many environments through join table
  has_many :environments_planets
  has_many :environments, through: :environments_planets
  has_many :bookings
  has_many_attached :photos
  # pg_search *should* allow for searching by environment and/or description
  pg_search_scope :global_search,
    against: [ :description, :name, ],
    associated_against: {
      environments: :name,
      user: [ :nickname, :first_name, :last_name ]
    },
    using: {
      tsearch: { prefix: true }
     }
end
