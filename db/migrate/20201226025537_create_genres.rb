class CreateGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :genres do |t|
      t.belongs_to :tag, null: false, foreign_key: true, index: {unique: true}
      t.timestamps
    end
  end
end
