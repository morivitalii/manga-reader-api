class CreateUserExcludedTags < ActiveRecord::Migration[6.1]
  def change
    create_table :user_excluded_tags do |t|
      t.belongs_to :user, foreign_key: true, index: true, null: false
      t.belongs_to :tag, foreign_key: true, index: true, null: false
      t.timestamps

      t.index [:user_id, :tag_id], unique: true
    end
  end
end
