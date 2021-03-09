class Api::Titles::Chapters::ToReviewPolicy < Api::ApplicationPolicy
  def update?
    user? && record.draft?
  end
end