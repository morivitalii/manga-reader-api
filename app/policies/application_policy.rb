class ApplicationPolicy
  def initialize(user, record = nil)
    @user = user
    @record = record
  end
end