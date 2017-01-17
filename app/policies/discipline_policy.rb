class DisciplinePolicy < ApplicationPolicy
  def index?
    user.try(:admin?)
  end

  def create?
    user.try(:admin?)
  end

  def show?
    user.try(:admin?)
  end

  def update?
    user.try(:admin?) || user.try(:teacher?)
  end

  def destroy?
    user.try(:admin?)
  end
end
