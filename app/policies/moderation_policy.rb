class ModerationPolicy < ApplicationPolicy
  def index?
    user.try(:admin?)
  end
end
