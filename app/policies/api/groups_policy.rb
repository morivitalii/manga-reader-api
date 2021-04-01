class Api::GroupsPolicy < Api::ApplicationPolicy
  include Api::GroupAccessRights

  def index?
    true
  end

  def show?
    true
  end

  def create?
    user?
  end

  def update?
    user? && user_have_group_access_right?(record, :manage_group)
  end

  def permitted_attributes_for_create
    [:title]
  end

  def permitted_attributes_for_update
    [:title]
  end

  class Scope < Api::ApplicationPolicy::Scope
    def resolve
      scope.all
    end
  end
end