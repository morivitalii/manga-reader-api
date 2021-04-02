class Api::Groups::UsersPolicy < Api::ApplicationPolicy
  include Api::GroupAccessRights

  def index?
    true
  end

  def show?
    true
  end

  def create?
    user? && user_have_group_access_right?(options[:group], :manage_users)
  end

  def update?
    user? && user_have_group_access_right?(options[:group], :manage_users)
  end

  def destroy?
    user? && user_have_group_access_right?(options[:group], :manage_users)
  end

  def permitted_attributes_for_create
    [:user_id, access_rights: []]
  end

  def permitted_attributes_for_update
    [access_rights: []]
  end

  class Scope < Api::ApplicationPolicy::Scope
    def resolve
      scope.all
    end
  end
end