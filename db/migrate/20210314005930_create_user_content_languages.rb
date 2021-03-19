class CreateUserContentLanguages < ActiveRecord::Migration[6.1]
  def change
    create_table :user_content_languages do |t|
      t.belongs_to :user, foreign_key: true, index: true, null: false
      t.belongs_to :content_language, foreign_key: true, index: true, null: false
      t.timestamps

      t.index [:user_id, :content_language_id], unique: true
    end
  end
end
