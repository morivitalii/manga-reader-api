require "pundit/rspec"

module PunditHelper
	def grant_access_right(user, access_right_key)
		access_right = AccessRight.find_or_create_by!(key: access_right_key)

		user.access_rights << access_right
	end

	def grant_group_access_right(group, user, access_right_key)
		group_user = GroupUser.find_or_create_by!(group: group, user: user)
		access_right = GroupAccessRight.find_or_create_by!(key: access_right_key)

		group_user.group_access_rights << access_right
	end
end

RSpec.configure do |config|
	config.include PunditHelper
end