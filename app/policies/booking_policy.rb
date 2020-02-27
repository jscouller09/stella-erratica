class BookingPolicy < ApplicationPolicy

  # by default #new will copy create
  def create?
    # only travellers can create bookings
    user && (user.traveller? || user.admin?)
  end

  # by default #edit will copy update
  # def update?
  #   # travellers and overlords can only update their own bookings
  #   record.user == user || record.planet.user
  # end

  def destroy?
    # travellers and overlords can only destroy their own bookings
    (user == (record.user || record.planet.user)) || user.admin?
  end

  def approve_booking?
    #only overlords who own the planet requested can approve booking
    (user == record.planet.user) || user.admin?
  end

  def reject_booking?
    #only overlords own the planet requested can approve booking
    (user == record.planet.user) || user.admin?
  end

  def destroy?
    # travellers and overlords can only destroy their own bookings
    (user == (record.user || record.planet.user)) || user.admin?
  end

  def complete_booking?
    # only travellers can complete bookings
    (user == record.user) || user.admin?
  end

  class Scope < Scope
    def resolve
      # set so overlords and travellers can only see their own bookings
      scope.all
    end
  end

end
