module Search
	module User
		extend ActiveSupport::Concern

		included do
			include Elasticsearch::Model

			ELASTICSEARCH_INDEX_SETTINGS = {
				analysis: {
					analyzer: {
						username_analyzer: {
							tokenizer: :username_tokenizer
						}
					},
					tokenizer: {
						username_tokenizer: {
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
					indexes :username, type: :text, analyzer: :username_analyzer
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