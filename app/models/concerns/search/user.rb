module Search
	module User
		extend ActiveSupport::Concern

		included do
			include Elasticsearch::Model

			settings do
				mappings dynamic: false, _source: { enabled: false } do
					indexes :username, type: :keyword
					indexes :created_at, type: :date

					indexes :title, type: :object do
						indexes :en, type: :text, analyzer: :english
						indexes :ru, type: :text, analyzer: :russian
					end
				end
			end

			def as_indexed_json(_options = {})
				ActiveRecord::Associations::Preloader.new.preload(
					self, [
						self.class.translations_associations
					]
				)

				{
					username: username,
					created_at: created_at
				}.to_json
			end
		end
	end
end