module AuthorizationHelper
	def has_access_to?(policy_class, action, options = {})
		method_name = "#{action}?"

		policy_class.new(Current.user, options).public_send(method_name)
	end
end