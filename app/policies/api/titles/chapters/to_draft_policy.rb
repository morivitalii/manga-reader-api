class Api::Titles::Chapters::ToDraftPolicy < Api::ApplicationPolicy
  def update?
    user?
  end
end