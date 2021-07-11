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

      @user.create_user_setting!

      # To know if we need to update object in elasticsearch,
      # please take a look for attributes and associations in index schema
      Search::Indexing::CreateObjectWorker.perform_async(@user.class.name, @user.id)
    end

    true
  rescue ActiveRecord::RecordInvalid => invalid
    errors.merge!(invalid.record.errors)

    false
  end
end
