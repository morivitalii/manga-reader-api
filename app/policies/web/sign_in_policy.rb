class Web::SignInPolicy < Web::ApplicationPolicy
	def new?
		visitor?
	end

	def create?
		visitor?
	end

	def unauthenticated?
		visitor?
	end

	def permitted_attributes_for_create
		[:username, :password]
	end
end