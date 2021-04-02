class Api::Groups::CreateUser
  include ActiveModel::Model

  attr_accessor :group, :user_id, :access_rights
  attr_reader :group_user

  def call
    ActiveRecord::Base.transaction do
      @group_user = group.group_users.create!(
        user: user
      )

      access_rights_objects.each do |access_right|
        @group_user.group_user_access_rights.create!(
          group_access_right: access_right
        )
      end
    end

    true
  rescue ActiveRecord::RecordInvalid => invalid
    errors.merge!(invalid.record.errors)

    false
  end

  private

  def user
    @user ||= User.where(id: user_id).take
  end

  def access_rights_objects
    @access_rights_objects = GroupAccessRight.where(key: access_rights).all
  end
end