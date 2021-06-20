class Api::Books::Chapters::ToReviewPolicy < Api::ApplicationPolicy
  def update?
    user?
  end
end