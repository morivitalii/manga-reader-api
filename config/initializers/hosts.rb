unless Rails.env.test?
	Rails.application.config.hosts << ENV.fetch("HOST")
end
