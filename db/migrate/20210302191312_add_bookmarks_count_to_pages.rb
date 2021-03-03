class AddBookmarksCountToPages < ActiveRecord::Migration[6.1]
  def change
    add_column :pages, :bookmarks_count, :bigint, null: false, default: 0
  end
end
