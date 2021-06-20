class Api::Books::Chapters::ToPublishedPolicy < Api::ApplicationPolicy
  def update?
    user?
  end
end