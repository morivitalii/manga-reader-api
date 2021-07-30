class RemoveCachedAtFromEveryTable < ActiveRecord::Migration[6.1]
  def change
    remove_column :access_rights, :cached_at, :datetime, limit: 6, null: false, default: -> { "now()::timestamp" }, index: true
    remove_column :artists, :cached_at, :datetime, limit: 6, null: false, default: -> { "now()::timestamp" }, index: true
    remove_column :bookmarks, :cached_at, :datetime, limit: 6, null: false, default: -> { "now()::timestamp" }, index: true
    remove_column :chapters, :cached_at, :datetime, limit: 6, null: false, default: -> { "now()::timestamp" }, index: true
    remove_column :content_languages, :cached_at, :datetime, limit: 6, null: false, default: -> { "now()::timestamp" }, index: true
    remove_column :favorites, :cached_at, :datetime, limit: 6, null: false, default: -> { "now()::timestamp" }, index: true
    remove_column :group_access_rights, :cached_at, :datetime, limit: 6, null: false, default: -> { "now()::timestamp" }, index: true
    remove_column :group_user_access_rights, :cached_at, :datetime, limit: 6, null: false, default: -> { "now()::timestamp" }, index: true
    remove_column :group_users, :cached_at, :datetime, limit: 6, null: false, default: -> { "now()::timestamp" }, index: true
    remove_column :groups, :cached_at, :datetime, limit: 6, null: false, default: -> { "now()::timestamp" }, index: true
    remove_column :interface_languages, :cached_at, :datetime, limit: 6, null: false, default: -> { "now()::timestamp" }, index: true
    remove_column :locales, :cached_at, :datetime, limit: 6, null: false, default: -> { "now()::timestamp" }, index: true
    remove_column :pages, :cached_at, :datetime, limit: 6, null: false, default: -> { "now()::timestamp" }, index: true
    remove_column :tags, :cached_at, :datetime, limit: 6, null: false, default: -> { "now()::timestamp" }, index: true
    remove_column :books, :cached_at, :datetime, limit: 6, null: false, default: -> { "now()::timestamp" }, index: true
    remove_column :user_access_rights, :cached_at, :datetime, limit: 6, null: false, default: -> { "now()::timestamp" }, index: true
    remove_column :user_content_languages, :cached_at, :datetime, limit: 6, null: false, default: -> { "now()::timestamp" }, index: true
    remove_column :user_excluded_tags, :cached_at, :datetime, limit: 6, null: false, default: -> { "now()::timestamp" }, index: true
    remove_column :user_settings, :cached_at, :datetime, limit: 6, null: false, default: -> { "now()::timestamp" }, index: true
    remove_column :users, :cached_at, :datetime, limit: 6, null: false, default: -> { "now()::timestamp" }, index: true
    remove_column :views, :cached_at, :datetime, limit: 6, null: false, default: -> { "now()::timestamp" }, index: true
    remove_column :volumes, :cached_at, :datetime, limit: 6, null: false, default: -> { "now()::timestamp" }, index: true
    end
end
