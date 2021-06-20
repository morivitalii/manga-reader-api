module Search
	module Group
		extend ActiveSupport::Concern

		included do
			include Elasticsearch::Model

			settings do
				mappings dynamic: false, _source: { enabled: false } do
					indexes :title, type: :text
					indexes :created_at, type: :date
				end
			end

			def as_indexed_json(_options = {})
				{
					title: title,
					created_at: created_at
				}.to_json
			end
		end
	end
end