class Api::InterfaceLanguagesPolicy < Api::ApplicationPolicy
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
    [:locale_id, :title]
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