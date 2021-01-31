class AddForeignKeyFromResourceFormatsToFormats < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :resource_formats, :formats, column: :format_id
  end
end
