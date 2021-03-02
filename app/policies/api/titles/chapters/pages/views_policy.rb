class Api::Titles::Chapters::Pages::ViewsPolicy < Api::ApplicationPolicy
  def create?
    user?
  end

  class Scope < Api::ApplicationPolicy::Scope
    def resolve
      scope.all
    end
  end
end