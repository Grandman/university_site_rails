class UserPolicy < ApplicationPolicy
  def index?
    user.try(:admin?)
  end

  def create?
    user.try(:admin?)
  end

  def update?
    user.try(:admin?)
  end

  def destroy?
    user.try(:admin?)
  end
end
