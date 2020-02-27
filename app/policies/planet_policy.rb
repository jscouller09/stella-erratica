class PlanetPolicy < ApplicationPolicy

  def index?
    # travellers and overlords can see all planets
    true
  end

  def show?
    # travellers and overlords can see details of a planet
    true
  end

  # by default #new will copy create
  def create?
    # only overlords can create planets
    user && (user.overlord? || user.admin?)
  end

  # by default #edit will copy update
  def update?
    # overlords can only update their own planets
    record.user == user || user.admin?
  end

  def destroy?
    # overlords can only destroy their own planets
    record.user == user || user.admin?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
