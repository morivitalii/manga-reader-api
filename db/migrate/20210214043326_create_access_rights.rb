class CreateAccessRights < ActiveRecord::Migration[6.1]
  def change
    create_table :access_rights do |t|
      t.string :key, null: false
      t.timestamps

      t.index "lower(key)", unique: true
    end
  end
end
