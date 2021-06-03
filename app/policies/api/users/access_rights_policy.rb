class Api::Users::AccessRightsPolicy < Api::ApplicationPolicy
	def show?
		# Current or specific user
		options.user.present?
	end

	def update?
		access_right?(:manage_users)
	end

	def permitted_attributes_for_update
		[access_right_ids: []]
	end
end