class AddFavoritesCountToGroups < ActiveRecord::Migration[6.1]
  def change
    add_column :groups, :favorites_count, :bigint, null: false, default: 0
  end
end
