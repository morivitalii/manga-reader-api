ActiveRecord::Base.transaction do
  # Access rights

  # Manage system settings right
  AccessRight.find_or_create_by!(key: :manage_system_settings)

	# Manage users access right
	AccessRight.find_or_create_by!(key: :manage_users)

  # Manage titles access right
  AccessRight.find_or_create_by!(key: :manage_titles)

  # Group access rights

  # Manage group access right
  GroupAccessRight.find_or_create_by!(key: :manage_group)

  # Manage group users access right
	GroupAccessRight.find_or_create_by!(key: :manage_users)

  # Manage group chapters right
	GroupAccessRight.find_or_create_by!(key: :manage_chapters)

	admin = User.create_with(email: "admin@example.com", password: "password").find_or_create_by!(username: "admin")

	admin.access_rights = AccessRight.all
end
