class Api::LocalesPolicy < Api::ApplicationPolicy
  def index?
    access_right?(:manage_system_settings)
  end

  def show?
    access_right?(:manage_system_settings)
  end

  def create?
    access_right?(:manage_system_settings)
  end

  def destroy?
    access_right?(:manage_system_settings)
  end

  class Scope < Api::ApplicationPolicy::Scope
    def resolve
      scope.all
    end
  end
end