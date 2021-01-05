class CreateGroupUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :group_users do |t|
      t.belongs_to :group, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true
      t.timestamps

      t.index [:group_id, :user_id], unique: true
    end
  end
end
