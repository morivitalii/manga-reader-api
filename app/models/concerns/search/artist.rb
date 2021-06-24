module Search
	module Artist
		extend ActiveSupport::Concern

		included do
			include Elasticsearch::Model

			settings do
				mappings dynamic: false, _source: { enabled: false } do
					indexes :name, type: :object do
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
					name: {
						ru: name_ru
					}
				}.to_json
			end
		end
	end
end