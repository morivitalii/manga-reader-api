class Api::Books::ToPublishedPolicy < Api::ApplicationPolicy
  def update?
    user?
  end
end