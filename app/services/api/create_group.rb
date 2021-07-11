class Api::CreateGroup
  include ActiveModel::Model

  attr_accessor :user, :title
  attr_reader :group

  def call
    ActiveRecord::Base.transaction do
      @group = Group.create!(
        title: title
      )

      group_user = @group.group_users.create!(user: user)
      group_user.group_user_access_rights.create!(group_user: group_user, group_access_right: manage_users_access_right)
      group_user.group_user_access_rights.create!(group_user: group_user, group_access_right: manage_chapters_access_right)

      # To know if we need to update object in elasticsearch,
      # please take a look for attributes and associations in index schema
      Search::Indexing::CreateObjectWorker.perform_async(@group.class.name, @group.id)
    end

    true
  rescue ActiveRecord::RecordInvalid => invalid
    errors.merge!(invalid.record.errors)

    false
  end

  private

  def manage_users_access_right
    @manage_users_access_right ||= GroupAccessRight.find_or_create_by!(key: :manage_users)
  end

  def manage_chapters_access_right
    @manage_chapters_access_right ||= GroupAccessRight.find_or_create_by!(key: :manage_chapters)
  end
end
