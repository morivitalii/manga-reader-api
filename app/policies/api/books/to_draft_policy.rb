class Api::Books::ToDraftPolicy < Api::ApplicationPolicy
  def update?
    user?
  end
end