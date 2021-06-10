class DropTypers < ActiveRecord::Migration[6.1]
  def change
    drop_table :typers do |t|
      t.belongs_to :artist, foreign_key: true, index: { unique: true }, null: false
      t.timestamps
      t.datetime :cached_at, precision: 6, null: false, default: -> { "now()::timestamp" }

      t.index :cached_at, order: :desc
    end
  end
end
