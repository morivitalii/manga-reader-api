class DropCovers < ActiveRecord::Migration[6.1]
  def change
    drop_table :covers do |t|
      t.belongs_to :content_language, foreign_key: true, null: false
      t.timestamps
    end
  end
end
