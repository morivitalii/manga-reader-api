class Api::Titles::ToReviewPolicy < Api::ApplicationPolicy
  def update?
    user?
  end
end