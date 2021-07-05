module Search
	module Group
		extend ActiveSupport::Concern

		included do
			include Elasticsearch::Model

			ELASTICSEARCH_INDEX_SETTINGS = {
				analysis: {
					analyzer: {
						title_analyzer: {
							tokenizer: :title_tokenizer
						}
					},
					tokenizer: {
						title_tokenizer: {
							type: :ngram,
							min_gram: 1,
							max_gram: 2,
							token_chars: [
								:letter,
								:digit
							]
						}
					}
				}
			}

			settings index: ELASTICSEARCH_INDEX_SETTINGS do
				mappings dynamic: false, _source: { enabled: false } do
					indexes :title, type: :text, analyzer: :title_analyzer
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