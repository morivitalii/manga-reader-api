class AddPublishedAtToTitles < ActiveRecord::Migration[6.1]
  def change
    add_column :titles, :published_at, :datetime
  end
end
