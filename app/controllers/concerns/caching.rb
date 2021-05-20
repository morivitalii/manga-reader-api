module Caching
  extend ActiveSupport::Concern

  private

  def endpoint_cache_key(scope)
    [I18n.locale, "endpoint", params[:controller], params[:action], "scope", scope.cache_key_with_version].join("/")
  end

  def variable_cache_key(scope)
    [I18n.locale, "scope", scope.cache_key_with_version].join("/")
  end
end
