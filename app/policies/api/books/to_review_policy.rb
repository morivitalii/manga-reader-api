class Api::Books::ToReviewPolicy < Api::ApplicationPolicy
  def update?
    user?
  end
end