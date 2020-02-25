class Environment < ApplicationRecord
  # same environment can be on many planets
  has_many :planets
  # must have a name
  validates :name, presence: true
end
