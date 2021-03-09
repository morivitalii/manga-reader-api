class Api::Titles::ToDraftPolicy < Api::ApplicationPolicy
  def update?
    user?
  end
end