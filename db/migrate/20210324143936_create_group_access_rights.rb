class CreateGroupAccessRights < ActiveRecord::Migration[6.1]
  def change
    create_table :group_access_rights do |t|
      t.integer :key, null: false
      t.timestamps

      t.index :key, unique: true
    end
  end
end
