class CommentPolicy < ApplicationPolicy
  def create?
    user.try(:admin?) || user.try(:student?) || user.try(:teacher?)
  end

  def destroy?
    user.try(:admin?)
  end
end
