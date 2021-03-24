class AddUsersCountToGroups < ActiveRecord::Migration[6.1]
  def change
    add_column :groups, :users_count, :bigint, null: false, default: 0
  end
end
