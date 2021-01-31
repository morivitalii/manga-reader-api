class AddForeignKeyFromResourceDemographicsToDemographics < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :resource_demographics, :demographics, column: :demographic_id
  end
end
