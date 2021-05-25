module Caching
  extend ActiveSupport::Concern

  private

  def endpoint_cache_key(scope)
    [I18n.locale, "endpoint", params[:controller], params[:action], "scope", scope.cache_key, cache_key_version(scope)].join("/")
  end

  def variable_cache_key(scope)
    [I18n.locale, "variable", scope.cache_key, cache_key_version(scope)].join("/")
  end

  def cache_key_version(scope)
    # Check for scope
    if scope.respond_to?(:loaded?)
      scope.maximum(:cached_at)&.to_time&.to_i || 0
    else
      scope.cached_at.to_time.to_i
    end
  end
end
