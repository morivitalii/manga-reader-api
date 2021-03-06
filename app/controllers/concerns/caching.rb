module Caching
  extend ActiveSupport::Concern

  private

  def cache_key(scope, name = nil, endpoint_specific = true)
    if endpoint_specific
      [I18n.locale, "endpoint", params[:controller], params[:action], "scope", scope.cache_key_with_version].compact.join("/")
    else
      [I18n.locale, "variable", name, "scope", scope.cache_key_with_version].compact.join("/")
    end
  end
end
