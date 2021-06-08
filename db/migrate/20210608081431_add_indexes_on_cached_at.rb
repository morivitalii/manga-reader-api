class AddIndexesOnCachedAt < ActiveRecord::Migration[6.1]
  def change
    add_index :access_rights, :cached_at, order: :desc
    add_index :artists, :cached_at, order: :desc
    add_index :bookmarks, :cached_at, order: :desc
    add_index :chapters, :cached_at, order: :desc
    add_index :cleaners, :cached_at, order: :desc
    add_index :content_languages, :cached_at, order: :desc
    add_index :demographics, :cached_at, order: :desc
    add_index :editors, :cached_at, order: :desc
    add_index :favorites, :cached_at, order: :desc
    add_index :formats, :cached_at, order: :desc
    add_index :genres, :cached_at, order: :desc
    add_index :group_access_rights, :cached_at, order: :desc
    add_index :group_user_access_rights, :cached_at, order: :desc
    add_index :group_users, :cached_at, order: :desc
    add_index :groups, :cached_at, order: :desc
    add_index :interface_languages, :cached_at, order: :desc
    add_index :locales, :cached_at, order: :desc
    add_index :marks, :cached_at, order: :desc
    add_index :pages, :cached_at, order: :desc
    add_index :painters, :cached_at, order: :desc
    add_index :tags, :cached_at, order: :desc
    add_index :themes, :cached_at, order: :desc
    add_index :titles, :cached_at, order: :desc
    add_index :translators, :cached_at, order: :desc
    add_index :typers, :cached_at, order: :desc
    add_index :user_access_rights, :cached_at, order: :desc
    add_index :user_content_languages, :cached_at, order: :desc
    add_index :user_excluded_tags, :cached_at, order: :desc
    add_index :user_settings, :cached_at, order: :desc
    add_index :users, :cached_at, order: :desc
    add_index :views, :cached_at, order: :desc
    add_index :volumes, :cached_at, order: :desc
    add_index :writers, :cached_at, order: :desc
  end
end
