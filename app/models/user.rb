class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :avatar
  # user must have a unique email (validated by devise)
  # user must have a first name and last name
  validates :email, presence: :true, uniqueness: :true
  validates :first_name, presence: :true
  validates :last_name, presence: :true
  has_many :planets
  has_many :bookings
  # this is so that a traveller will have planets but only through bookings
  has_many :destination_planets, through: :bookings, source: :planet
  # while an overlord will have bookings but only through planets
  has_many :incoming_bookings, through: :planets, source: :bookings
  # as opposed to a traveller "owning" the planet or an overlord *making* a booking

  def full_name
    "#{first_name} #{last_name}"
  end
end
