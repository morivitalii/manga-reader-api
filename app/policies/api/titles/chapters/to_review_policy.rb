class Api::Titles::Chapters::ToReviewPolicy < Api::ApplicationPolicy
  def update?
    user?
  end
end