class Environment < ApplicationRecord
  # same environment can be on many planets
  has_many :environments_planets
  has_many :planets, through: :environments_planets
  # must have a name
  validates :name, presence: true, uniqueness: true
end
