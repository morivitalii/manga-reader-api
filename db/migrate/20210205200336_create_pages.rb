class CreatePages < ActiveRecord::Migration[6.1]
  def change
    create_table :pages do |t|
      t.belongs_to :chapter, foreign_key: true, null: false
      t.belongs_to :cleaner, foreign_key: true, null: false
      t.belongs_to :translator, foreign_key: true, null: false
      t.belongs_to :editor, foreign_key: true, null: false
      t.belongs_to :typer, foreign_key: true, null: false
      t.integer :number, foreign_key: true, null: false
      t.timestamps

      t.index :number
      t.index [:chapter_id, :number], unique: true
    end
  end
end
