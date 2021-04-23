class ChangeKeyTypeFromIntegerToStirngInGroupAccessRights < ActiveRecord::Migration[6.1]
  def change
    change_column :group_access_rights, :key, :string
  end
end
