class Web::SignUpPolicy < Web::ApplicationPolicy
	def new?
		visitor?
	end

	def create?
		visitor?
	end

	def permitted_attributes_for_create
		[:username, :email, :password]
	end
end