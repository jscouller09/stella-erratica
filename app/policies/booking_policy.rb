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

  def dashboard?
    true
  end

  class Scope < Scope
    def resolve
      # set so overlords and travellers can only see their own bookings
      if user.overlord?
        user.incoming_bookings
      elsif user.traveller?
        scope.where(user: user)
      end
    end
  end
end
