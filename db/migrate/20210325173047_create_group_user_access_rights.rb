class CreateGroupUserAccessRights < ActiveRecord::Migration[6.1]
  def change
    create_table :group_user_access_rights do |t|
      t.belongs_to :group_access_right, foreign_key: true, null: false, index: true
      t.belongs_to :group_user, foreign_key: true, null: false, index: true
      t.timestamps

      t.index [:group_access_right_id, :group_user_id], unique: true, name: "index_group_user_access_rights_uniqueness"
    end
  end
end
