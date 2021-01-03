module Pagination
  extend ActiveSupport::Concern

  included do
    include Pagy::Backend

    alias_method :paginate_countless, :pagy_countless
    alias_method :set_pagination_headers, :pagy_headers_merge
  end
end
