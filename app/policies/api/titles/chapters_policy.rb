class Api::Titles::ChaptersPolicy < Api::ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def create?
    user?
  end

  def permitted_attributes_for_create
    [:volume_id, :group_id, :name, :number]
  end

  class Scope < Api::ApplicationPolicy::Scope
    def resolve
      scope.all
    end
  end
end