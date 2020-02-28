class ReviewPolicy < ApplicationPolicy
  def create?
    # travelers on the booking are the only ones who can leave a new review
    user && ((user == record.booking.user) || user.admin?)
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
