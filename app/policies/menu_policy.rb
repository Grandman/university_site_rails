class MenuPolicy < ApplicationPolicy
  def update?
    user.try(:admin?)
  end
end
