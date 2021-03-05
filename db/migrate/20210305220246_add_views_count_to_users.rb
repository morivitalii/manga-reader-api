class AddViewsCountToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :views_count, :bigint, null: false, default: 0
  end
end
