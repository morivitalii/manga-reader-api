module Search
	module Chapter
		extend ActiveSupport::Concern

		included do
			include Elasticsearch::Model

			settings do
				mappings dynamic: false, _source: { enabled: false } do
					indexes :content_language_id, type: :long
					indexes :book_id, type: :long
					indexes :volume, type: :integer
					indexes :group_id, type: :long
					indexes :number, type: :integer
					indexes :status, type: :keyword
					indexes :views_count, type: :long
					indexes :bookmarks_count, type: :long
					indexes :pages_count, type: :integer
					indexes :name, type: :text
					indexes :created_at, type: :date
					indexes :deleted_at, type: :date
				end
			end

			def as_indexed_json(_options = {})
				{
					content_language_id: content_language_id,
					book_id: book_id,
					volume_id: volume_id,
					group_id: group_id,
					number: number,
					status: status,
					views_count: views_count,
					bookmarks_count: bookmarks_count,
					pages_count: pages_count,
					name: name,
					created_at: created_at,
					deleted_at: deleted_at,
				}.to_json
			end
		end
	end
end