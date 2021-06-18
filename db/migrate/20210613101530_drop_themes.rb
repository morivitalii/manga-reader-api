class DropThemes < ActiveRecord::Migration[6.1]
  def change
    drop_table :themes do |t|
      t.belongs_to :tag, foreign_key: true, index: { unique: true }, null: false
      t.timestamps
      t.datetime :cached_at, precision: 6, null: false, default: -> { "now()::timestamp" }

      t.index :cached_at, order: :desc
    end
  end
end
