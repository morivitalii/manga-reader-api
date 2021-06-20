class Api::Books::Chapters::ToDraftPolicy < Api::ApplicationPolicy
  def update?
    user?
  end
end