class AddViewsCountToPages < ActiveRecord::Migration[6.1]
  def change
    add_column :pages, :views_count, :bigint, null: false, default: 0
  end
end
