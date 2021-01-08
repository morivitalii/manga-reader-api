class Api::SignIn
  include ActiveModel::Model

  attr_accessor :username, :password

  validate :validate_credentials

  def validate_credentials
    if user.blank? || !user.authenticate(password)
      errors.add(:username, :invalid)
    end
  end

  def user
    @_user ||= User.where("lower(username) = lower(?)", username).take
  end
end
