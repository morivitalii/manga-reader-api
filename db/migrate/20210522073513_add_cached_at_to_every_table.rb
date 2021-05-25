class AddCachedAtToEveryTable < ActiveRecord::Migration[6.1]
  def change
    add_column :access_rights, :cached_at, :datetime, limit: 6, null: false, default: -> { "now()::timestamp" }
    add_column :artists, :cached_at, :datetime, limit: 6, null: false, default: -> { "now()::timestamp" }
    add_column :bookmarks, :cached_at, :datetime, limit: 6, null: false, default: -> { "now()::timestamp" }
    add_column :chapters, :cached_at, :datetime, limit: 6, null: false, default: -> { "now()::timestamp" }
    add_column :cleaners, :cached_at, :datetime, limit: 6, null: false, default: -> { "now()::timestamp" }
    add_column :content_languages, :cached_at, :datetime, limit: 6, null: false, default: -> { "now()::timestamp" }
    add_column :demographics, :cached_at, :datetime, limit: 6, null: false, default: -> { "now()::timestamp" }
    add_column :editors, :cached_at, :datetime, limit: 6, null: false, default: -> { "now()::timestamp" }
    add_column :favorites, :cached_at, :datetime, limit: 6, null: false, default: -> { "now()::timestamp" }
    add_column :formats, :cached_at, :datetime, limit: 6, null: false, default: -> { "now()::timestamp" }
    add_column :genres, :cached_at, :datetime, limit: 6, null: false, default: -> { "now()::timestamp" }
    add_column :group_access_rights, :cached_at, :datetime, limit: 6, null: false, default: -> { "now()::timestamp" }
    add_column :group_user_access_rights, :cached_at, :datetime, limit: 6, null: false, default: -> { "now()::timestamp" }
    add_column :group_users, :cached_at, :datetime, limit: 6, null: false, default: -> { "now()::timestamp" }
    add_column :groups, :cached_at, :datetime, limit: 6, null: false, default: -> { "now()::timestamp" }
    add_column :interface_languages, :cached_at, :datetime, limit: 6, null: false, default: -> { "now()::timestamp" }
    add_column :locales, :cached_at, :datetime, limit: 6, null: false, default: -> { "now()::timestamp" }
    add_column :marks, :cached_at, :datetime, limit: 6, null: false, default: -> { "now()::timestamp" }
    add_column :pages, :cached_at, :datetime, limit: 6, null: false, default: -> { "now()::timestamp" }
    add_column :painters, :cached_at, :datetime, limit: 6, null: false, default: -> { "now()::timestamp" }
    add_column :tags, :cached_at, :datetime, limit: 6, null: false, default: -> { "now()::timestamp" }
    add_column :themes, :cached_at, :datetime, limit: 6, null: false, default: -> { "now()::timestamp" }
    add_column :titles, :cached_at, :datetime, limit: 6, null: false, default: -> { "now()::timestamp" }
    add_column :translators, :cached_at, :datetime, limit: 6, null: false, default: -> { "now()::timestamp" }
    add_column :typers, :cached_at, :datetime, limit: 6, null: false, default: -> { "now()::timestamp" }
    add_column :user_access_rights, :cached_at, :datetime, limit: 6, null: false, default: -> { "now()::timestamp" }
    add_column :user_content_languages, :cached_at, :datetime, limit: 6, null: false, default: -> { "now()::timestamp" }
    add_column :user_excluded_tags, :cached_at, :datetime, limit: 6, null: false, default: -> { "now()::timestamp" }
    add_column :user_settings, :cached_at, :datetime, limit: 6, null: false, default: -> { "now()::timestamp" }
    add_column :users, :cached_at, :datetime, limit: 6, null: false, default: -> { "now()::timestamp" }
    add_column :views, :cached_at, :datetime, limit: 6, null: false, default: -> { "now()::timestamp" }
    add_column :volumes, :cached_at, :datetime, limit: 6, null: false, default: -> { "now()::timestamp" }
    add_column :writers, :cached_at, :datetime, limit: 6, null: false, default: -> { "now()::timestamp" }
  end
end
