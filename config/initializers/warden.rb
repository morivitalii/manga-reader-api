Rails.application.config.middleware.use(Warden::Manager) do |manager|
  manager.intercept_401 = false
  manager.default_strategies(:password)
  manager.failure_app = lambda { |env|
		controller = case env["warden.options"][:attempted_path]
								 when "/api/sign_in"
                   Api::SignInController
                 when "/sign_in"
									 Web::SignInController
								 end

    controller.action(env["warden.options"][:action]).call(env)
	}
end

Warden::Manager.serialize_into_session do |user|
  user.id
end

Warden::Manager.serialize_from_session do |id|
  User.find(id)
end

Warden::Strategies.add(:api_password) do
  def authenticate!
    service = Api::SignIn.new(
      username: params.dig("username"),
      password: params.dig("password")
    )

    service.valid? ? success!(service.user) : throw(:warden, service: service)
  end
end

Warden::Strategies.add(:web_password) do
	def authenticate!
		service = Api::SignIn.new(
			username: params.dig("sign_in", "username"),
			password: params.dig("sign_in", "password")
		)

		service.valid? ? success!(service.user) : throw(:warden, service: service)
	end
end
