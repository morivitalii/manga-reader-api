module Search
	module Group
		extend ActiveSupport::Concern

		included do
			include Elasticsearch::Model

			settings do
				mappings dynamic: false, _source: { enabled: false } do
					indexes :title, type: :text
					indexes :favorites_count, type: :integer
					indexes :users_count, type: :integer
					indexes :created_at, type: :date
					indexes :updated_at, type: :date
				end
			end

			def as_indexed_json(_options = {})
				ActiveRecord::Associations::Preloader.new.preload(
					self, [
						self.class.translations_associations
					]
				)

				{
					title: title,
					favorites_count: favorites_count,
					users_count: users_count,
					created_at: created_at,
					updated_at: updated_at
				}.to_json
			end
		end
	end
end