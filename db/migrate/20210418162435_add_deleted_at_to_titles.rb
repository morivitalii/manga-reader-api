class AddDeletedAtToTitles < ActiveRecord::Migration[6.1]
  def change
    add_column :titles, :deleted_at, :datetime
  end
end
