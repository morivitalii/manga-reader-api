class Api::LocalesPolicy < Api::ApplicationPolicy
  def index?
    user? && access_right?(:manage_system_settings)
  end

  def show?
    user? && access_right?(:manage_system_settings)
  end

  def create?
    user? && access_right?(:manage_system_settings)
  end

  def destroy?
    user? && access_right?(:manage_system_settings)
  end

  class Scope < Api::ApplicationPolicy::Scope
    def resolve
      scope.all
    end
  end
end