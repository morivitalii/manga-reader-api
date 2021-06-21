unless Rails.env.test?
	Rails.application.config.hosts << ENV.fetch("CORS_ORIGINS")
end
