class Api::Users::Views::TitlesPolicy < Api::ApplicationPolicy
  def index?
    user?
  end

  class Scope < Api::ApplicationPolicy::Scope
    def resolve
      scope.all
    end
  end
end