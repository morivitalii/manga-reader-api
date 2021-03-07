class Api::Titles::ToReviewPolicy < Api::ApplicationPolicy
  def update?
    user? && record.draft?
  end
end