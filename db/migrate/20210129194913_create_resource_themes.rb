class CreateResourceThemes < ActiveRecord::Migration[6.1]
  def change
    create_table :resource_themes do |t|
      t.belongs_to :theme, null: false
      t.belongs_to :resource, polymorphic: true, null: false
      t.timestamps

      t.index [:theme_id, :resource_type, :resource_id], unique: true, name: "index_resource_themes_uniqueness"
    end
  end
end
