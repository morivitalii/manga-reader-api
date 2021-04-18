class ChangeUniquenessIndexOnKeyInAccessRights < ActiveRecord::Migration[6.1]
  def change
    remove_index :access_rights, "lower(key)", unique: true
    add_index :access_rights, :key, unique: true
  end
end
