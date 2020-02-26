class BookingPolicy < ApplicationPolicy

  # by default #new will copy create
  def create?
    # only travellers can create bookings
    user.traveller?
  end

  # by default #edit will copy update
  def update?
    # travellers and overlords can only update their own bookings
    record.user == user || record.planet.user
  end

  def destroy?
    # travellers and overlords can only destroy their own bookings
    record.user == user || record.planet.user
  end

  class Scope < Scope
    def resolve
      # there is no booking index for now, so ok
      scope.all
    end
  end
end
