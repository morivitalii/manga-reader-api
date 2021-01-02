class Api::ContentLanguagesPolicy < Api::ApplicationPolicy
  def index?
    true
  end
end