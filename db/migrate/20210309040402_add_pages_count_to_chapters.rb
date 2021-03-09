class AddPagesCountToChapters < ActiveRecord::Migration[6.1]
  def change
    add_column :chapters, :pages_count, :bigint, null: false, default: 0
  end
end
