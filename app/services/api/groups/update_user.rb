class Api::Groups::UpdateUser
  include ActiveModel::Model

  attr_accessor :group_user, :access_rights

  def call
    ActiveRecord::Base.transaction do
      @group_user.group_access_rights = access_rights_objects
      @group_user.save!
    end

    true
  rescue ActiveRecord::RecordInvalid => invalid
    errors.merge!(invalid.record.errors)

    false
  end

  private

  def access_rights_objects
    @access_rights_objects = GroupAccessRight.where(key: access_rights).all
  end
end