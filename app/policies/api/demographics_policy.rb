class Api::DemographicsPolicy < Api::ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def create?
    access_right?(:manage_system_settings)
  end

  def update?
    access_right?(:manage_system_settings)
  end

  def destroy?
    access_right?(:manage_system_settings)
  end

  def permitted_attributes_for_create
    [:key, :title, :description]
  end

  def permitted_attributes_for_update
    [:key, :title, :description]
  end

  class Scope < Api::ApplicationPolicy::Scope
    def resolve
      scope.all
    end
  end
end