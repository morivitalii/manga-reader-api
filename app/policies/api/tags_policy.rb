class Api::TagsPolicy < Api::ApplicationPolicy
  def index?
    true
  end
end