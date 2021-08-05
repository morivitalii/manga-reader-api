class Web::HomePolicy < Web::ApplicationPolicy
	def index?
		true
	end
end