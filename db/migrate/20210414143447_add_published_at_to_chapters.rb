class AddPublishedAtToChapters < ActiveRecord::Migration[6.1]
  def change
    add_column :chapters, :published_at, :datetime
  end
end
