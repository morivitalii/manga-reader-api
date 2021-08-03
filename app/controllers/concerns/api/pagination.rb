module Api::Pagination
  extend ActiveSupport::Concern

  included do
    include Pagy::Backend

    def paginate_countless(collection)
      pagination, collection = pagy_countless(collection)

      pagy_headers_merge(pagination)

      collection
    end
  end
end
