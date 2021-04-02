class Api::Groups::DeleteUser
  include ActiveModel::Model

  attr_accessor :group_user

  def call
    ActiveRecord::Base.transaction do
      @group_user.destroy!
    end

    true
  rescue ActiveRecord::RecordInvalid => invalid
    errors.merge!(invalid.record.errors)

    false
  end
end