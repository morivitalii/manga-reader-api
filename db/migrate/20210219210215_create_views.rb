class CreateViews < ActiveRecord::Migration[6.1]
  def change
    create_table :views do |t|
      t.belongs_to :user, foreign_key: true, null: false, index: true
      t.belongs_to :resource, polymorphic: true, null: false
      t.datetime :created_at, precision: 6, null: false, index: true

      t.index [:user_id, :resource_type, :resource_id], unique: true, name: "index_views_uniqueness"
    end
  end
end
