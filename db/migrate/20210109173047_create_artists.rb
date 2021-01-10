class CreateArtists < ActiveRecord::Migration[6.1]
  def change
    create_table :artists do |t|
      t.belongs_to :user, foreign_key: true, null: true, index: { unique: true }
      t.timestamps
    end
  end
end
