class Api::Books::VolumesPolicy < Api::ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def create?
    access_right?(:manage_books)
  end

  def update?
    access_right?(:manage_books)
  end

  def destroy?
    access_right?(:manage_books)
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