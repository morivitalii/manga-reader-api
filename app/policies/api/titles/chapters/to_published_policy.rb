class Api::Titles::Chapters::ToPublishedPolicy < Api::ApplicationPolicy
  def update?
    user?
  end
end