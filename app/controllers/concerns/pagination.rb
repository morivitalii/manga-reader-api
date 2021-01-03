module Pagination
  extend ActiveSupport::Concern

  included do
    include Pagy::Backend
  end
end
