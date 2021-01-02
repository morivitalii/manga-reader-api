class Api::MarksPolicy < Api::ApplicationPolicy
  def index?
    true
  end
end