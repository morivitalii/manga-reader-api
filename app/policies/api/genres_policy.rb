class Api::GenresPolicy < Api::ApplicationPolicy
  def index?
    true
  end
end