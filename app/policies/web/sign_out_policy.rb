class Web::SignOutPolicy < Web::ApplicationPolicy
	def destroy?
		user?
	end
end