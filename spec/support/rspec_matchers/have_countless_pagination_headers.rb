require "rspec/expectations"

RSpec::Matchers.define :have_countless_pagination_headers do |params|
  match do |response|
    response.headers["X-Pagination-Page-Number"] == params[:page].to_s &&
      response.headers["X-Pagination-Page-Items-Count"] == params[:limit].to_s
  end
end
