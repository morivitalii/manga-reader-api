class AddForeignKeyFromResourcePaintersToPainters < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :resource_painters, :painters, column: :painter_id
  end
end
