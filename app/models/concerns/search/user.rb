module Search
	module User
		extend ActiveSupport::Concern

		included do
			include Elasticsearch::Model

			settings do
				mappings dynamic: false, _source: { enabled: false } do
					indexes :username, type: :keyword
					indexes :created_at, type: :date
				end
			end

			def as_indexed_json(_options = {})
				{
					username: username,
					created_at: created_at
				}.to_json
			end
		end
	end
end