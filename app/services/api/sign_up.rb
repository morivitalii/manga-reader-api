class Api::SignUp
  include ActiveModel::Model

  attr_accessor :username, :email, :password
  attr_reader :user

  def call
    ActiveRecord::Base.transaction do
      @user = User.create!(
        username: username,
        email: email,
        password: password
      )
    end

    true
  rescue ActiveRecord::RecordInvalid => invalid
    errors.merge!(invalid.record.errors)

    false
  end
end
