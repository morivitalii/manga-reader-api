class Api::CreateGroup
  include ActiveModel::Model

  attr_accessor :user, :title
  attr_reader :group

  def call
    ActiveRecord::Base.transaction do
      @group = Group.new(
        title: title
      )

      @group.save!

      group_user = @group.group_users.create!(user: user)
      group_user.group_user_access_rights.create!(group_user: group_user, group_access_right: manage_users_access_right)
      group_user.group_user_access_rights.create!(group_user: group_user, group_access_right: manage_chapters_access_right)
    end

    true
  rescue ActiveRecord::RecordInvalid => invalid
    errors.merge!(invalid.record.errors)

    false
  end

  private

  def manage_users_access_right
    @manage_users_access_right ||= GroupAccessRight.where(key: :manage_users).take!
  end

  def manage_chapters_access_right
    @manage_chapters_access_right ||= GroupAccessRight.where(key: :manage_chapters).take!
  end
end