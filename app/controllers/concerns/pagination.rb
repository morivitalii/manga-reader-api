module Pagination
  extend ActiveSupport::Concern

  included do
    include Pagy::Backend

    alias_method :set_pagination_headers, :pagy_headers_merge

    def paginate_countless(collection)
      pagination, collection = pagy_countless(collection)

      set_pagination_headers(pagination)

      collection
    end
  end
end
