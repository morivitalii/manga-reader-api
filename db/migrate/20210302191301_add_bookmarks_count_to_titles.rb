class AddBookmarksCountToTitles < ActiveRecord::Migration[6.1]
  def change
    add_column :titles, :bookmarks_count, :bigint, null: false, default: 0
  end
end
