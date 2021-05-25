# This module is intended to simplify cache invalidation
#
# Example:
#
#   class User < ActiveRecord::Base
#     has_many :comments
#
#     invalidate_association_cache :comments
#   end
#
#   class Comment < ActiveRecord::Base
#     belongs_to :user
#
#     invalidate_association_cache :user
#   end
#
# This code will trigger update for all comments with new value for cached_at attribute:
#
#   User.take.update!(username: "example")
#
# This code will trigger update for user with new value for cached_at attribute:
#
#   Comment.take.update!(text: "example")

module CacheInvalidation
  extend ActiveSupport::Concern

  class_methods do
    def invalidate_association_cache(association_name)
      method_name = "invalidate_#{association_name}_association_cache".to_sym

      define_method(method_name) do
        if self.previous_changes.present? || self.destroyed?
          reflection = association(association_name).reflection
          macro = reflection.macro
          foreign_key = reflection.foreign_key

          query = reflection.klass.all

          if macro.in?([:belongs_to])
            value = self.attributes[foreign_key]

            query.where!(id: value)
          else
            query.where!(foreign_key => self.id)
          end

          query.update_all(cached_at: Time.current)
        end
      end

      # Invoke callback after record destroy
      self.after_save(method_name)

      # Invoke callback after record destroy
      self.after_destroy(method_name)
    end
  end
end