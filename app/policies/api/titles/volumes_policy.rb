class Api::Titles::VolumesPolicy < Api::ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  class Scope < Api::ApplicationPolicy::Scope
    def resolve
      scope.all
    end
  end
end