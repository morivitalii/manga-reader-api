class AddForeignKeyFromResourceThemesToThemes < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :resource_themes, :themes, column: :theme_id
  end
end
