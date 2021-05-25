class Api::TranslatorsPolicy < Api::ApplicationPolicy
  def show?
    true
  end

  class Scope < Api::ApplicationPolicy::Scope
    def resolve
      scope.all
    end
  end
end