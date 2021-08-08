class Web::ArtistsPolicy < Web::ApplicationPolicy
	def	new?
		access_right?(:manage_content)
	end

	def	create?
		access_right?(:manage_content)
	end

	class Scope < Web::ApplicationPolicy::Scope
		def resolve
			scope.all
		end
	end

	def permitted_attributes_for_create
		[:name]
	end
end