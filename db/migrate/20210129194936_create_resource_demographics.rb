class CreateResourceDemographics < ActiveRecord::Migration[6.1]
  def change
    create_table :resource_demographics do |t|
      t.belongs_to :demographic, null: false
      t.belongs_to :resource, polymorphic: true, null: false
      t.timestamps

      t.index [:demographic_id, :resource_type, :resource_id], unique: true, name: "index_resource_demographics_uniqueness"
    end
  end
end
