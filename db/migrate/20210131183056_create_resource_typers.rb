class CreateResourceTypers < ActiveRecord::Migration[6.1]
  def change
    create_table :resource_typers do |t|
      t.belongs_to :typer, null: false, foreign_key: true
      t.belongs_to :resource, polymorphic: true, null: false
      t.timestamps

      t.index [:typer_id, :resource_type, :resource_id], unique: true, name: "index_resource_typers_uniqueness"
    end
  end
end
