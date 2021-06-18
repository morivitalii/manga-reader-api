class DropResourceDemographics < ActiveRecord::Migration[6.1]
	def change
		drop_table :resource_demographics do |t|
			t.belongs_to :demographic, foreign_key: true, index: { unique: true }, null: false
			t.belongs_to :resource, foreign_key: true, index: true, null: false
			t.timestamps

			t.index [:demographic_id, :resource_type, :resource_id], unique: true, name: :index_resource_translators_uniqueness
		end
	end
end
