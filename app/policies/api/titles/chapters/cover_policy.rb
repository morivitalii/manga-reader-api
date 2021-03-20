class Api::Titles::Chapters::CoverPolicy < Api::ApplicationPolicy
  def update?
    user?
  end

  def destroy?
    user?
  end

  def permitted_attributes_for_update
    [:file]
  end

  class Scope < Api::ApplicationPolicy::Scope
    def resolve
      scope.all
    end
  end
end