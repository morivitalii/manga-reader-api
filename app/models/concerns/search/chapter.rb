module Search
	module Chapter
		extend ActiveSupport::Concern

		included do
			include Elasticsearch::Model

			settings do
				mappings dynamic: false, _source: { enabled: false } do
					indexes :content_language_id, type: :long
					indexes :book_id, type: :long
					indexes :group_id, type: :long
					indexes :title, type: :text
					indexes :volume, type: :integer
					indexes :number, type: :integer
					indexes :status, type: :keyword
					indexes :created_at, type: :date
					indexes :deleted_at, type: :date
				end
			end

			def as_indexed_json(_options = {})
				{
					content_language_id: content_language_id,
					book_id: book_id,
					group_id: group_id,
					title: title,
					volume: volume,
					number: number,
					status: status,
					created_at: created_at,
					deleted_at: deleted_at,
				}.to_json
			end
		end
	end
end