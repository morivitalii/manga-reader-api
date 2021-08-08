# Array extra: Paginate arrays efficiently, avoiding expensive array-wrapping and without overriding
# See https://ddnexus.github.io/pagy/extras/array
# require "pagy/extras/array"

# Countless extra: Paginate without any count, saving one query per rendering
# See https://ddnexus.github.io/pagy/extras/countless
require "pagy/extras/countless"
Pagy::VARS[:cycle] = false

# Elasticsearch Rails extra: Paginate `ElasticsearchRails::Results` objects
# See https://ddnexus.github.io/pagy/extras/elasticsearch_rails
# require "pagy/extras/elasticsearch_rails"

# Headers extra: http response headers (and other helpers) useful for API pagination
# See http://ddnexus.github.io/pagy/extras/headers
require "pagy/extras/headers"
Pagy::VARS[:headers] = {
  pages: "X-Pagination-Pages-Count",
  page: "X-Pagination-Page-Number",
  items: "X-Pagination-Page-Items-Count",
  count: "X-Pagination-Total-Items-Count",
}

# Support extra: Extra support for features like: incremental, infinite, auto-scroll pagination
# See https://ddnexus.github.io/pagy/extras/support
# require "pagy/extras/support"

# Items extra: Allow the client to request a custom number of items per page with an optional selector UI
# See https://ddnexus.github.io/pagy/extras/items
require "pagy/extras/items"
Pagy::VARS[:items_param] = :limit
Pagy::VARS[:max_items] = 50

# Overflow extra: Allow for easy handling of overflowing pages
# See https://ddnexus.github.io/pagy/extras/overflow
require "pagy/extras/overflow"
Pagy::VARS[:overflow] = :empty_page

# Trim extra: Remove the page=1 param from links
# See https://ddnexus.github.io/pagy/extras/trim
require "pagy/extras/trim"

# Pagy Variables
# See https://ddnexus.github.io/pagy/api/pagy#variables
# All the Pagy::VARS are set for all the Pagy instances but can be overridden
# per instance by just passing them to Pagy.new or the #pagy controller method

# Instance variables
# See https://ddnexus.github.io/pagy/api/pagy#instance-variables
Pagy::VARS[:items] = 50

# Other Variables
# See https://ddnexus.github.io/pagy/api/pagy#other-variables
# Pagy::VARS[:size]       = [1,4,4,1]                       # default
# Pagy::VARS[:page_param] = :page                           # default
# Pagy::VARS[:params]     = {}                              # default
# Pagy::VARS[:anchor]     = "#anchor"                       # example
# Pagy::VARS[:link_extra] = "data-remote="true""            # example

require "pagy/extras/bootstrap"
