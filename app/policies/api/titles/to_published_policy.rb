class Api::Titles::ToPublishedPolicy < Api::ApplicationPolicy
  def update?
    user?
  end
end