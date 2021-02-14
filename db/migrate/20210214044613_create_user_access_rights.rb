class CreateUserAccessRights < ActiveRecord::Migration[6.1]
  def change
    create_table :user_access_rights do |t|
      t.belongs_to :user, foreign_key: true, null: false
      t.belongs_to :access_right, foreign_key: true, null: false
      t.timestamps

      t.index [:user_id, :access_right_id], unique: true
    end
  end
end
