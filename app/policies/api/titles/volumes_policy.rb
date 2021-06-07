class Api::Titles::VolumesPolicy < Api::ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def create?
    access_right?(:manage_titles)
  end

  def update?
    access_right?(:manage_titles)
  end

  def destroy?
    access_right?(:manage_titles)
  end

  def permitted_attributes_for_create
    [:number]
  end

  def permitted_attributes_for_update
    [:number]
  end

  class Scope < Api::ApplicationPolicy::Scope
    def resolve
      scope.all
    end
  end
end