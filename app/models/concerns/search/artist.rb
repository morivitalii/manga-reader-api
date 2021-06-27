module Search
	module Artist
		extend ActiveSupport::Concern

		included do
			include Elasticsearch::Model

			settings do
				mappings dynamic: false, _source: { enabled: false } do
					indexes :name, type: :text
				end
			end

			def as_indexed_json(_options = {})
				ActiveRecord::Associations::Preloader.new.preload(
					self, [
						self.class.translations_associations
					]
				)

				{
					name: name_all_locales_values
				}.to_json
			end
		end
	end
end